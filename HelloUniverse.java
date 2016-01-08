

import java.applet.Applet;
import java.awt.BorderLayout;
import java.awt.GraphicsConfiguration;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;	
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;

import javax.media.j3d.Alpha;
import javax.media.j3d.BoundingSphere;
import javax.media.j3d.BranchGroup;
import javax.media.j3d.Canvas3D;
import javax.media.j3d.RotationInterpolator;
import javax.media.j3d.Transform3D;
import javax.media.j3d.TransformGroup;
import javax.vecmath.Point3d;
import javax.vecmath.Vector3d;
	
import com.sun.j3d.utils.applet.MainFrame;
import com.sun.j3d.utils.behaviors.vp.OrbitBehavior;
import com.sun.j3d.utils.geometry.ColorCube;
import com.sun.j3d.utils.universe.SimpleUniverse;

public class HelloUniverse extends Applet implements MouseMotionListener, KeyListener {

	private SimpleUniverse u = null;
	private Canvas3D c = null;
	private static final double TURNSPEED = 0.0005;
	private static final double MOVESPEED = 5000000;
	TransformGroup objTrans = new TransformGroup();
	
	// Used to for the last position of the mouse
	private int lastX = 0;
	private int lastY = 0;
	// Needed for changing the camera position
	private Transform3D yAxis = new Transform3D();;
	private Vector3d vector = new Vector3d();
	BranchGroup objRoot = new BranchGroup();
	
	public BranchGroup createSceneGraph() {
		// Create the root of the branch graph
		
		// Create the TransformGroup node and initialize it to the
		// identity. Enable the TRANSFORM_WRITE capability so that
		// our behavior code can modify it at run time. Add it to
		// the root of the subgraph.
		objTrans.setCapability(TransformGroup.ALLOW_TRANSFORM_WRITE);
		objRoot.addChild(objTrans);
		
		// Create a simple Shape3D node; add it to the scene graph.
		objTrans.addChild(new ColorCube(0.4));
		
		// Create a new Behavior object that will perform the
		// desired operation on the specified yAxis and add
		// it into the scene graph.
		Alpha rotationAlpha = new Alpha(-1, 4000);
		
		RotationInterpolator rotator = new RotationInterpolator(rotationAlpha, objTrans, yAxis, 0.0f,
				(float) Math.PI * 2.0f);
//				BoundingSphere bounds = new BoundingSphere(new Point3d(0.0, 0.0, 0.0), 100.0);
//				rotator.setSchedulingBounds(bounds);
//				objRoot.addChild(rotator);

				// Have Java 3D perform optimizations on this scene graph.
				objRoot.compile();

				return objRoot;
	}

	public HelloUniverse() {
		}

		@Override
		public void init() {
			setLayout(new BorderLayout());
			GraphicsConfiguration config = SimpleUniverse.getPreferredConfiguration();

			Canvas3D c = new Canvas3D(config);
			add("Center", c);
			c.addMouseMotionListener(this);
			// Create a simple scene and attach it to the virtual universe
			BranchGroup scene = createSceneGraph();
			u = new SimpleUniverse(c);

			// This will move the ViewPlatform back a bit so the
			// objects in the scene can be viewed.
			objTrans = u.getViewingPlatform().getViewPlatformTransform();

			
			OrbitBehavior orbit = new OrbitBehavior(c, OrbitBehavior.REVERSE_ROTATE);
			orbit.setSchedulingBounds(new BoundingSphere());
			u.getViewingPlatform().setViewPlatformBehavior(orbit);
			
			
			u.addBranchGraph(scene);
			u.getViewingPlatform().setNominalViewingTransform();

		}

		@Override
		public void destroy() {
			u.cleanup();
		}

		
		
		//
		// The following allows HelloUniverse to be run as an application
		// as well as an applet
		//
		@Override
		public void mouseDragged(MouseEvent e) {
			
			objTrans.getTransform(yAxis);
		
			yAxis.get(vector);
			yAxis.rotZ(1000);
			// Increasing or decreasing the x value of the Vector3d
			vector.x -= (e.getX() - lastX) * TURNSPEED;
			lastX = e.getX();
			vector.y += (e.getY() - lastY) * TURNSPEED;
			lastY = e.getY();

			yAxis.set(vector);
			objTrans.setTransform(yAxis);
		}

		public static void main(String[] args) {
			new MainFrame(new HelloUniverse(), 900, 900);
		}

		@Override
		public void mouseMoved(MouseEvent e) {
			lastX = e.getX();
			lastY = e.getY();
			// TODO Auto-generated method stub

		}

		@Override
		public void keyPressed(KeyEvent e) {

		}

		@Override
		public void keyReleased(KeyEvent e) {
			// TODO Auto-generated method stub

		}

		@Override
		public void keyTyped(KeyEvent e) {
			objTrans.getTransform(yAxis);
			yAxis.get(vector);
			// Increasing or decreasing the x value of the Vector3d

			switch (e.getKeyChar()) {
			case 'a':
				// moves camera to the left
				vector.x -= MOVESPEED;
				break;
			case 'd':
				// moves camera to the right
				vector.x += MOVESPEED;
				break;
			case 'w':
				// moves camera to the left
				vector.y -= MOVESPEED;
				break;
			case 's':
				// moves camera to the right
				vector.y += MOVESPEED;
			}

			yAxis.set(vector);
			objTrans.setTransform(yAxis);
		}
	}

