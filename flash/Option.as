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
class Option extends MovieClip
{
	var textbox: TextField;
	var baseX: Number;
	
	public function Option() {
		super();
		baseX = this._x;
		textbox.text = this._name;
	}
	
	public function resetPos() {
		this._x = baseX;
	}
}