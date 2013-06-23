/**
 * Part of a series of articles on Processing 2.
 * Blog post here:
 * http://vormplus.be/blog/article/working-with-the-pshape-class
 */

PShape hexagon;

boolean saveOne = false;

void setup()
{
    size( 450, 320, P2D );
    smooth();
    
    hexagon = createShape();
    hexagon.beginShape();
    for ( int i = 0; i < 6; i++ ) {
        float x = cos( i * THIRD_PI ) * 20;
        float y = sin( i * THIRD_PI ) * 20;
        hexagon.vertex( x, y );
    }
    hexagon.endShape( CLOSE );
    
    hexagon.setFill( color( 255, 64 ) );
    hexagon.setStroke( color( #0E8D94, 128 ) );
    
    background( #E9D558 );
}

void draw()
{
    pushMatrix();
    translate( mouseX, mouseY );
    shape( hexagon );
    popMatrix();
    
    if ( saveOne ) {
        saveFrame("images/custom-hexagon-#####.png");
        saveOne = false;
    }
}

void keyPressed()
{
    saveOne = true;
}
