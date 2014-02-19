import java.awt.Robot;
import java.awt.*;
import java.awt.image.*;

PImage screenShot;

void setup()
{
    size( displayWidth, displayHeight );
    
    takeScreenShot();

    background( 0 );
}

void draw()
{
    // getPixelsAroundMouse();
    image( screenShot, 0, 0 );
}
/*
void getPixelsAroundMouse()
{
    Rectangle screenRect = new Rectangle( Toolkit.getDefaultToolkit().getScreenSize() );
    
    try {
        
        BufferedImage screenBuffer = new Robot().createScreenCapture( screenRect );
        
        screenShot = new PImage( 40, 40, PConstants.ARGB );
        screenBuffer.getRGB( mouseX, mouseY, screenShot.width, screenShot.height, screenShot.pixels, 0, screenShot.width );
        screenShot.updatePixels();
        
    } catch ( AWTException e ) {
        e.printStackTrace();
    }
}
*/
void takeScreenShot()
{
    Rectangle screenRect = new Rectangle( Toolkit.getDefaultToolkit().getScreenSize() );
    
    try {
        
        BufferedImage screenBuffer = new Robot().createScreenCapture( screenRect );
        
        screenShot = new PImage( screenBuffer.getWidth(), screenBuffer.getHeight(), PConstants.ARGB );
        screenBuffer.getRGB( 0, 0, screenShot.width, screenShot.height, screenShot.pixels, 0, screenShot.width );
        screenShot.updatePixels();
        
    } catch ( AWTException e ) {
        e.printStackTrace();
    }
}

void keyPressed()
{
    if ( key == 'c' ) {
        takeScreenShot();
    }
}
