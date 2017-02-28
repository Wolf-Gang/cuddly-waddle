
class pair {
  
  private entity right;
  private entity left;
  
  private float separation;
  
  private float angle;
  
  pair() {
  }
  
  pair(const pair &in other) {
	
    this.right = other.get_right();
    this.left = other.get_left();
    
    this.separation = other.get_separation();
    
    this.angle = other.get_angle();
    //this.angle = other.get_position();
	
  }
  
  pair(string pRight_texture, string pLeft_texture, float pSeparation, vec &in pPosition, float pAngle = 0) {
    
    right = add_entity(pRight_texture);
    left = add_entity(pLeft_texture);
    
    separation = pSeparation;
    
    angle = pAngle;
    
    set_pair_position(pPosition);
  }
  
  pair(string pRight_texture, string pRight_atlas, string pLeft_texture, string pLeft_atlas, float pSeparation, vec &in pPosition, float pAngle = 0) {
    
    right = add_entity(pRight_texture, pRight_atlas);
    left = add_entity(pLeft_texture, pLeft_atlas);
    
    separation = pSeparation;
    
    angle = pAngle;
    
    set_pair_position(pPosition);
  }
  
  pair(string pPair_texture, float pSeparation, float pAngle = 0) {
    
    left = add_entity(pPair_texture);
    right = add_entity(pPair_texture);
    
    separation = pSeparation;
    
    angle = pAngle;
  }
  
  pair(string pPair_texture, string pPair_atlas, float pSeparation, vec &in pPosition, float pAngle = 0) {
    
    left = add_entity(pPair_texture, pPair_atlas);
    right = add_entity(pPair_texture, pPair_atlas);
    
    separation = pSeparation;
    
    angle = pAngle;
  }
  
  void set_left(entity e) {
    left = e;
  }
  
  entity get_left() const {
    
    return left;
    
  }
  
  void set_right(entity e) {
    
    right = e;
    
  }
  
  entity get_right() const { 
    
    return right;
    
  }
  
  void set_separation(float pSeparation) {
    
    separation = pSeparation;
    
    update_positions();
  }
  
  float get_separation() const {
    
    return separation;
    
  }
  
  void set_angle(float pRadians) {
    
    angle = pRadians;
    
    update_positions();
  }
  
  float get_angle()  const {
    
    return angle;
    
  }
  
  void set_pair_position(vec pPos_left) {
    
    set_position(left, pPos_left);
    
    set_position(right, vec(pPos_left.x * cos(angle), pPos_left.y * sin(angle)));
  }
  
  vec get_pair_position() {
    
    return get_position(left);
    
  }
  
  void set_pair_atlas(string atlas) {
    
    set_atlas(right, atlas);
    set_atlas(left, atlas);
  }

  void start_pair_animation() {
    
    start_animation(right);
    start_animation(left);
  }

  void set_pair_depth(float depth) {
    
    set_depth(right, depth);
    set_depth(left, depth);
  }
  
  /*
  pair@ opAssign(const pair &in other) {
    
    this.right = other.get_right();
    this.left = other.get_left();
    
    this.separation = other.get_separation();
    
	this.angle = other.get_angle();
	
    //this.angle = other.get_pair_position();
  }
  */
  private void update_positions() {
    set_position(left, get_position(left));
  }
  
}
