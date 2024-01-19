import { Browser } from "../../../utils/Browser";
import { ClassUtils } from "../../../utils/ClassUtils";
import { BlueprintConst } from "../../core/BlueprintConst";
import { IRuntimeDataManger } from "../../core/interface/IRuntimeDataManger";
import { TBPCNode } from "../../datas/types/BlueprintTypes";
import { BlueprintPinRuntime } from "../BlueprintPinRuntime";
import { IBPRutime } from "../interface/IBPRutime";
import { IRunAble } from "../interface/IRunAble";
import { BlueprintRuntimeBaseNode } from "./BlueprintRuntimeBaseNode";

export class BlueprintNewTargetNode extends BlueprintRuntimeBaseNode {
    cls: ClassDecorator;

    parse(def: TBPCNode) {
        super.parse(def);
        let arr = def.target.split(".");
        if (arr.length == 1) {
            this.cls = ClassUtils.getClass(arr[0]);
        }
        else {
            let cls = Browser.window;
            arr.forEach(value => {
                cls = cls[value];
            })
            this.cls = cls;
        }
        if (!this.cls) {
            console.warn("regclass not find " + arr[0]);
        }
    }

    step(context: IRunAble, runTimeData: IRuntimeDataManger, fromExcute: boolean, runner: IBPRutime, enableDebugPause: boolean, runId: number): number {
        if (fromExcute && context.beginExcute(this, runner, enableDebugPause)) {
            return BlueprintConst.MAX_CODELINE;
        }
        let _parmsArray: any[] = runTimeData.getDataById(this.nid).getParamsArray(runId);;
        _parmsArray.length = 0;
        const inputPins = this.inPutParmPins;
        for (let i = 0, n = inputPins.length; i < n; i++) {
            const curInput = inputPins[i];
            let from = curInput.linkTo[0];
            if (from) {
                (from as BlueprintPinRuntime).step(context, runTimeData, runner, runId);
                context.parmFromOtherPin(curInput, runTimeData, from as BlueprintPinRuntime, _parmsArray, runId);
            }
            else {
                context.parmFromSelf(curInput, runTimeData, _parmsArray, runId);
            }
        }
        context.parmFromOutPut(this.outPutParmPins, runTimeData, _parmsArray);


        let result = Reflect.construct(this.cls, _parmsArray);

        runTimeData.setPinData(this.outPutParmPins[0], result, runId);
        if (fromExcute) {
            context.endExcute(this);
        }
        return this.next(context, runTimeData, _parmsArray, runner, enableDebugPause, runId);
    }
}