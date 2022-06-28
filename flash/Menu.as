import com.greensock.*;
import com.greensock.easing.*;
import gfx.io.GameDelegate;
import gfx.managers.FocusHandler;
import gfx.ui.InputDetails;
import gfx.ui.NavigationCode;
import Shared.GlobalFunc;
import mx.utils.Delegate;
import skse;
import Mouse;
// by osmosis-wrench 2022
class Menu extends MovieClip
{
	var OptionContainer: MovieClip;
	var options: Array = new Array(8);
	var test: MovieClip;
	
	var testArr: Array = new Array(10);
	var idx: Number;
	var moving: Boolean;
	
	public function Menu() {
		super();
		options = [ OptionContainer.o0, OptionContainer.o1, OptionContainer.o2, OptionContainer.o3, OptionContainer.o4, OptionContainer.o5, OptionContainer.o6, OptionContainer.o7 ]
		testArr = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
		idx = 0;
		test.onMouseDown = function () {
			_parent.doMoveTest();
		}
		moving = false;
	}
	
	function onLoad(){
		for (var x = 0; x < options.length; x++){
			options[x].textbox.text = testArr[idx+x];
		}
		//doMoveTest();
	}
	
	function fixPos(){
		for (var x = 0; x < options.length; x++){
			options[x].resetPos();
		}
		moving = false;
	}
	
	function doMoveTest() {
		if (moving){
			return
		}
		moving = true;
		
		idx = idx + 1;
		if ( idx > testArr.length -1 ) { 
			idx = 0; 
		}
		for (var x = 0; x < options.length; x++) {
			options[x].textbox.text = testArr[isValid(idx+x)];
			if (x == options.length - 1){
				TweenLite.from(options[x], 1, {_x:options[x].baseX + (options[1].baseX - options[0].baseX), onComplete: fixPos()});
			} else {
				TweenLite.from(options[x], 1, {_x:options[x+1].baseX, onComplete: fixPos()});
			}
		}
		
	}
	
	function isValid(i):Number{
		
		if (i > testArr.length -1){
			return i - testArr.length;
		} else if ( i < 0 ) {
			return testArr.length - 1;
		} else {
			return i;
		}
	}
}