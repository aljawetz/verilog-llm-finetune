`timescale 1ns/1ps

module tb_washing_machine;

reg clk;
reg rst;
reg start;
reg door_close;
reg filled;
reg normal_wash;
reg quick_wash;
reg detergent_added;
reg cycle_time_out;
reg drained;
reg spin_time_out;

wire door_lock;
wire fill_valve_on;
wire water_wash;
wire soap_wash;
wire motor_on;
wire drain_valve_on;
wire done;

// Instantiate the washing machine module
washing_machine uut (
    .clk(clk),
    .rst(rst),
    .start(start),
    .door_close(door_close),
    .filled(filled),
    .normal_wash(normal_wash),
    .quick_wash(quick_wash),
    .detergent_added(detergent_added),
    .cycle_time_out(cycle_time_out),
    .drained(drained),
    .spin_time_out(spin_time_out),
    .door_lock(door_lock),
    .fill_valve_on(fill_valve_on),
    .water_wash(water_wash),
    .soap_wash(soap_wash),
    .motor_on(motor_on),
    .drain_valve_on(drain_valve_on),
    .done(done)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    start = 0;
    door_close = 0;
    filled = 0;
    normal_wash = 0;
    quick_wash = 0;
    detergent_added = 0;
    cycle_time_out = 0;
    drained = 0;
    spin_time_out = 0;

    // Reset the system
    #10 rst = 0;

    // Test sequence
    // Test 1: Start washing machine with door closed and filled
    #10 door_close = 1; start = 1; filled = 1; normal_wash = 1; 
    #10 if (uut.p_state !== 3'b001) $display("FAIL: Expected state fill_water, got %b", uut.p_state);
    
    // Test 2: Soak phase
    #10 detergent_added = 1; 
    #10 if (uut.p_state !== 3'b011) $display("FAIL: Expected state rinse, got %b", uut.p_state);
    
    // Test 3: Rinse phase
    #10 cycle_time_out = 1; 
    #10 if (uut.p_state !== 3'b100) $display("FAIL: Expected state drain_water, got %b", uut.p_state);
    
    // Test 4: Drain phase
    #10 drained = 1; 
    #10 if (uut.p_state !== 3'b101) $display("FAIL: Expected state dryer, got %b", uut.p_state);
    
    // Test 5: Dryer phase
    #10 spin_time_out = 1; 
    #10 if (uut.p_state !== 3'b000 || !done) $display("FAIL: Expected state idle and done signal high, got %b and done=%b", uut.p_state, done);
    
    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule