/**
 * Part of a series of articles on Processing 2.
 * Blog post here:
 * http://vormplus.be/blog/article/drawing-shapes-with-quadratic-vertices
 */

boolean DEBUG = false;
boolean saveOne = false;

void setup()
{
    size( 450, 320 );
    smooth();
}

void draw()
{
    background( #BDF018 );

    translate( width/2, height/2 );

    float stepAngle = TWO_PI / 6;

    fill( #ffffff );
    noStroke();

    float cr = map( mouseX, 0, width, 20, 200 );

    beginShape();
    for ( int i = 0; i < 7; i++ ) {

        float x = cos( stepAngle * i ) * 100;
        float y = sin( stepAngle * i ) * 100;

        float cx = cos( stepAngle * i - ( stepAngle / 2 ) ) * cr;
        float cy = sin( stepAngle * i - ( stepAngle / 2 ) ) * cr;

        if ( i == 0 ) {
            vertex( x, y );
        } else {
            quadraticVertex( cx, cy, x, y );
        }
    }
    endShape( CLOSE );

    if ( DEBUG ) {

        // draw lines between points
        strokeWeight( 1 );
        noFill();
        stroke( 0 );

        beginShape();
        for ( int i = 0; i < 7; i++ ) {

            float x = cos( stepAngle * i ) * 100;
            float y = sin( stepAngle * i ) * 100;

            float cx = cos( stepAngle * i - ( stepAngle / 2 ) ) * cr;
            float cy = sin( stepAngle * i - ( stepAngle / 2 ) ) * cr;

            if ( i > 0 ) {
                vertex( cx, cy );
            }
            vertex( x, y );
        }
        endShape( CLOSE );

        // draw points
        strokeWeight( 8 );

        for ( int i = 0; i < 7; i++ ) {

            float x = cos( stepAngle * i ) * 100;
            float y = sin( stepAngle * i ) * 100;

            float cx = cos( stepAngle * i - ( stepAngle / 2 ) ) * cr;
            float cy = sin( stepAngle * i - ( stepAngle / 2 ) ) * cr;

            stroke( 0 );
            point( x, y );

            stroke( 255, 0, 0 );
            point( cx, cy );
        }
    }
    
    if ( saveOne ) {
        saveFrame("images/quadraticvertex-#####.png");
        saveOne = false;
    }
}

void keyPressed()
{
    if ( key == 's' ) {
        saveOne = true;
    }
    
    if ( key == 'd' ) {
        DEBUG = !DEBUG;
    }
}

