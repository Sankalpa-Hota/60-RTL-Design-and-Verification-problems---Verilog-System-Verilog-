//Q2 : Write UVM SystemVerilog constraint for integer array of 10 elements where exactly 3 elements share the same value (triplicate), and the remaining 7 elements are all unique and different from the triplicate value. Total: 8 distinct values (1 appearing 3 times, 7 appearing once each).
class three_same extends uvm_object;
  `uvm_object_utils(three_same)

  rand bit [7:0] arr[10];
  rand bit [7:0] dup_val;
  rand int unsigned dup_idx[3];

  function new(string name = "three_same");
    super.new(name);
  endfunction

  // 3 distinct positions for the triplicate
  constraint c_dup_idx {
  unique {dup_idx};
  }
  constraint c_dup_idx_range {
  foreach(dup_idx[i]) dup_idx[i] inside {[0:9]};
  }

  // Exactly 3 elements equal dup_val, others different from it
  constraint c_triplicate {
    foreach(arr[i]) {
      if ( i inside {dup_idx}) begin
             arr[i] == dup_val;
      end
      else begin
         arr[i] != dup_val;
      end
    }
  }

  constraint c_bounds {
    dup_val inside {[0:255]};
    foreach(arr[i]) arr[i] inside {[0:255]};
  }
endclass
