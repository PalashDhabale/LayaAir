package laya.ui {
	import laya.ui.Image;
	import laya.utils.Handler;
	import laya.ui.UIComponent;
	import laya.ui.Image;
	import laya.utils.Handler;

	/**
	 * 值发生改变后调度。
	 * @eventType laya.events.Event
	 */

	/**
	 * <code>ProgressBar</code> 组件显示内容的加载进度。
	 * @example <caption>以下示例代码，创建了一个新的 <code>ProgressBar</code> 实例，设置了它的皮肤、位置、宽高、网格等信息，并添加到舞台上。</caption>
	 * @example Laya.init(640, 800);//设置游戏画布宽高
	 * @example import ProgressBar = laya.ui.ProgressBar;
	 */
	public class ProgressBar extends UIComponent {

		/**
		 * 当 <code>ProgressBar</code> 实例的 <code>value</code> 属性发生变化时的函数处理器。
		 * <p>默认返回参数<code>value</code> 属性（进度值）。</p>
		 */
		public var changeHandler:Handler;

		/**
		 * @private 
		 */
		protected var _bg:Image;

		/**
		 * @private 
		 */
		protected var _bar:Image;

		/**
		 * @private 
		 */
		protected var _skin:String;

		/**
		 * @private 
		 */
		protected var _value:Number;

		/**
		 * 创建一个新的 <code>ProgressBar</code> 类实例。
		 * @param skin 皮肤地址。
		 */

		public function ProgressBar(skin:String = undefined){}

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
		 * @copy laya.ui.Image#skin
		 */
		public function get skin():String{return null;}
		public function set skin(value:String):void{}
		protected function _skinLoaded():void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override protected function measureWidth():Number{
			return null;
		}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override protected function measureHeight():Number{
			return null;
		}

		/**
		 * 当前的进度量。
		 * <p><b>取值：</b>介于0和1之间。</p>
		 */
		public function get value():Number{return null;}
		public function set value(num:Number):void{}

		/**
		 * @private 更改进度值的显示。
		 */
		protected function changeValue():void{}

		/**
		 * 获取进度条对象。
		 */
		public function get bar():Image{return null;}

		/**
		 * 获取背景条对象。
		 */
		public function get bg():Image{return null;}

		/**
		 * <p>当前 <code>ProgressBar</code> 实例的进度条背景位图（ <code>Image</code> 实例）的有效缩放网格数据。</p>
		 * <p>数据格式："上边距,右边距,下边距,左边距,是否重复填充(值为0：不重复填充，1：重复填充)"，以逗号分隔。
		 * <ul><li>例如："4,4,4,4,1"</li></ul></p>
		 * @see laya.ui.AutoBitmap.sizeGrid
		 */
		public function get sizeGrid():String{return null;}
		public function set sizeGrid(value:String):void{}

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
		 * @inheritDoc 
		 * @override 
		 */
		override public function set dataSource(value:*):void{}

		/**
		 * @inheritDoc 
		 * @override 
		 */
		override public function get dataSource():*{return null;}
	}

}