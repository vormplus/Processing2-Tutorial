/**
 * Part of a series of articles on Processing 2.
 * Blog post here:
 * http://vormplus.be/blog/article/working-with-the-pshape-class
 */

PShape rectangle;
PShape circle;

void setup()
{
    size( 450, 320, P2D );
    smooth();
    
    rectangle = createShape( RECT, 40, 80, 160, 160 );
    circle = createShape( ELLIPSE, 250, 80, 160, 160 );
    
    rectangle.setFill( #FF823A );
    rectangle.setStroke( #F04155 );
    rectangle.setStrokeWeight( 4 );
    
    circle.setFill( #95CFB7 );
    circle.setStroke( false );
}

void draw()
{
    background( #FFF7BD );
    shape( rectangle );   
    shape( circle );
}
