/**
 * Part of a series of articles on Processing 2.
 * Blog post here:
 * http://vormplus.be/blog/article/drawing-shapes-with-holes
 */

float outerRadius = 120;
float innerRadius = 70;

float outerAngle;
float innerAngle;

boolean saveOne = false;

void setup()
{
    size( 450, 320, P2D );
    smooth();
   
    outerAngle = TWO_PI / 8;
    innerAngle = TWO_PI / 6;
    
    rectMode( CENTER );
    noStroke();
}

void draw()
{
    background( #3B8686 );
    
    
    fill( #CFF09E );
    rect( width/2, height/2, 400, 80 );
    
    fill( #0B486B );
    
    float a = radians( frameCount );

    translate( mouseX, mouseY );
    
    beginShape();
    
    for ( int i = 0; i < 8; i++ ) {
        float x = cos( i * outerAngle - a ) * outerRadius;
        float y = sin( i * outerAngle - a ) * outerRadius;
        vertex( x, y );
    }
    
    beginContour();
    for ( int i = 0; i < 6; i++ ) {
        float x = cos( i * innerAngle + a ) * innerRadius;
        float y = sin( i * innerAngle + a ) * innerRadius;
        vertex( x, y );
    }
    endContour();
    
    endShape( CLOSE );

    if ( saveOne ) {
        saveFrame("images/shapes-with-holes-#####.png");
        saveOne = false;
    }    
}

void keyPressed()
{
    if ( key == 's' ) {
        saveOne = true;
    }
}

