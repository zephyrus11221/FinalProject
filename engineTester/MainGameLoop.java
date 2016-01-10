package engineTester;

import org.lwjgl.opengl.Display;

import renderEngine.DisplayManager;

public class MainGameLoop {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		DisplayManager.createDisplay();
		
		while(!Display.isCloseRequested()){
			
			DisplayManager.updateDisplay();
		}
		DisplayManager.closeDisplay();
	}

}
