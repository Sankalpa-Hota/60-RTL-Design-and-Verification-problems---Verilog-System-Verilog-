// Constrained-random starter template
class dv_seq_item extends uvm_sequence_item;
  `uvm_object_utils(dv_seq_item)

  // TODO: Declare the rand variables needed for this problem.
    rand int c_array[10];
  function new(string name = "dv_seq_item");
    super.new(name);
  endfunction

  constraint c_main {
    // TODO: Add the required constraints here.
    
    //c_array.sum() == 100;
    c_array[0]+c_array[1]+c_array[2]+c_array[3]+c_array[4]+c_array[5]+c_array[6]+c_array[7]+c_array[8]+c_array[9]==10;

  }

  function void post_randomize();
    // TODO: Add any derived calculations or output queue construction here.
    int c = 0;
    foreach(c_array[i]) c = c+ c_array[i];
    assert(c == 100) else $fatal("Sum Mismatch: %0d",c) //We did assert here to check if constraint work properly and to add a print statement in case it failed.
  endfunction
endclass

