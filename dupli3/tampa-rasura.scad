$fn=30;

module rounded(dim=[10,10], r=2){
  assign(w=dim[0], h=dim[1])
  hull()
  for (i=[-1,1])
    for (j=[-1,1])
      translate([i*(w/2-r),j*(h/2-r)])
      circle(r=r);
}

module adesivo_esquerdo(){
  R = 5;
  W = 80;
  H = 48;

  render()
  difference(){
    rounded([W,H], r=R);

    for (i=[-1,1])
      translate([i*(W/2 - R), -(H/2 - R)])
      circle(r=3/2);

    for (i=[-1,1])
      translate([i*61/2, (H/2 - (7+11)/2)])
      square([12.5, 4], center=true);
    
    translate([-W/2+(39+16)/2,-H/2])
    rounded([(39-16),2*18], r=2);

    translate([-W/2+(39+16)/2,-H/2])
    rounded([27,2*11], r=2);
  }
}

module adesivo_direito(){
  R = 5;

  render() 
  difference(){
    union(){
      square([29-R,37]);

      translate([0,R])
      square([29,37-R]);

      translate([29-R,R])
      circle(r=R);
    }

    translate([29-R,R])
    circle(r=3/2);

    translate([0,21])
    rounded([2*5, 8],center=true);
  }
}


translate([0,0])
adesivo_esquerdo();

translate([45,-20])
adesivo_direito();

