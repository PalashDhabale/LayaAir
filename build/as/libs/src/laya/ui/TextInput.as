package laya.ui {
	import laya.ui.AutoBitmap;
	import laya.ui.Label;
	import laya.ui.AutoBitmap;

	/**
	 * 输入文本后调度。
	 * @eventType Event.INPUT
	 */

	/**
	 * 在输入框内敲回车键后调度。
	 * @eventType Event.ENTER
	 */

	/**
	 * 当获得输入焦点后调度。
	 * @eventType Event.FOCUS
	 */

	/**
	 * 当失去输入焦点后调度。
	 * @eventType Event.BLUR
	 */

	/**
	 * <code>TextInput</code> 类用于创建显示对象以显示和输入文本。
	 * @example <caption>以下示例代码，创建了一个 <code>TextInput</code> 实例。</caption>
	 * @example Laya.init(640, 800);//设置游戏画布宽高
	 * @example import Stage = laya.display.Stage;
	 */
	public class TextInput extends Label {

		/**
		 * @private 
		 */
		protected var _bg:AutoBitmap;

		/**
		 * @private 
		 */
		protected var _skin:String;

		/**
		 * 创建一个新的 <code>TextInput</code> 类实例。
		 * @param text 文本内容。
		 */

		public function TextInput(text:String = undefined){}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override protected function preinitialize():void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function destroy(destroyChild:Boolean = null):void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override protected function createChildren():void{}

		/**
		 * @private 
		 */
		private var _onFocus:*;

		/**
		 * @private 
		 */
		private var _onBlur:*;

		/**
		 * @private 
		 */
		private var _onInput:*;

		/**
		 * @private 
		 */
		private var _onEnter:*;

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override protected function initialize():void{}

		/**
		 * 表示此对象包含的文本背景 <code>AutoBitmap</code> 组件实例。
		 */
		public function get bg():AutoBitmap{return null;}
		public function set bg(value:AutoBitmap):void{}

		/**
		 * @copy laya.ui.Image#skin
		 */
		public function get skin():String{return null;}
		public function set skin(value:String):void{}
		protected function _skinLoaded():void{}

		/**
		 * <p>当前实例的背景图（ <code>AutoBitmap</code> ）实例的有效缩放网格数据。</p>
		 * <p>数据格式："上边距,右边距,下边距,左边距,是否重复填充(值为0：不重复填充，1：重复填充)"，以逗号分隔。
		 * <ul><li>例如："4,4,4,4,1"</li></ul></p>
		 * @see laya.ui.AutoBitmap.sizeGrid
		 */
		public function get sizeGrid():String{return null;}
		public function set sizeGrid(value:String):void{}

		/**
		 * 当前文本内容字符串。
		 * @see laya.display.Text.text
		 * @override 
		 */
		override public function set text(value:String):void{}

		/**
		 * @override 
		 */
		override public function get text():String{return null;}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function set width(value:Number):void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function get width():Number{return null;}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function set height(value:Number):void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function get height():Number{return null;}

		/**
		 * <p>指示当前是否是文本域。</p>
		 * 值为true表示当前是文本域，否则不是文本域。
		 */
		public function get multiline():Boolean{return null;}
		public function set multiline(value:Boolean):void{}

		/**
		 * 设置可编辑状态。
		 */
		public function set editable(value:Boolean):void{}
		public function get editable():Boolean{return null;}

		/**
		 * 选中输入框内的文本。
		 */
		public function select():void{}

		/**
		 * 限制输入的字符。
		 */
		public function get restrict():String{return null;}
		public function set restrict(pattern:String):void{}

		/**
		 * @copy laya.display.Input#prompt
		 */
		public function get prompt():String{return null;}
		public function set prompt(value:String):void{}

		/**
		 * @copy laya.display.Input#promptColor
		 */
		public function get promptColor():String{return null;}
		public function set promptColor(value:String):void{}

		/**
		 * @copy laya.display.Input#maxChars
		 */
		public function get maxChars():Number{return null;}
		public function set maxChars(value:Number):void{}

		/**
		 * @copy laya.display.Input#focus
		 */
		public function get focus():Boolean{return null;}
		public function set focus(value:Boolean):void{}

		/**
		 * @copy laya.display.Input#type
		 */
		public function get type():String{return null;}
		public function set type(value:String):void{}
		public function setSelection(startIndex:Number,endIndex:Number):void{}
	}

}