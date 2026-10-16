`timescale 1ns/1ps

module tb_sbox2;

reg [4:0] in;
wire [1:0] out;
reg [1:0] expected_out;

// Instantiate the module under test
sbox2 uut (
    .in(in),
    .out(out)
);

initial begin
    // Test cases
    // Test case 1
    in = 5'h00; #10; expected_out = 2'h3; check_output();
    
    // Test case 2
    in = 5'h01; #10; expected_out = 2'h1; check_output();
    
    // Test case 3
    in = 5'h02; #10; expected_out = 2'h0; check_output();
    
    // Test case 4
    in = 5'h03; #10; expected_out = 2'h2; check_output();
    
    // Test case 5
    in = 5'h04; #10; expected_out = 2'h2; check_output();
    
    // Test case 6
    in = 5'h05; #10; expected_out = 2'h3; check_output();
    
    // Test case 7
    in = 5'h06; #10; expected_out = 2'h3; check_output();
    
    // Test case 8
    in = 5'h07; #10; expected_out = 2'h0; check_output();
    
    // Test case 9
    in = 5'h08; #10; expected_out = 2'h1; check_output();
    
    // Test case 10
    in = 5'h09; #10; expected_out = 2'h3; check_output();
    
    // Test case 11
    in = 5'h0A; #10; expected_out = 2'h2; check_output();
    
    // Test case 12
    in = 5'h0B; #10; expected_out = 2'h1; check_output();
    
    // Test case 13
    in = 5'h0C; #10; expected_out = 2'h0; check_output();
    
    // Test case 14
    in = 5'h0D; #10; expected_out = 2'h0; check_output();
    
    // Test case 15
    in = 5'h0E; #10; expected_out = 2'h1; check_output();
    
    // Test case 16
    in = 5'h0F; #10; expected_out = 2'h2; check_output();
    
    // Test case 17
    in = 5'h10; #10; expected_out = 2'h3; check_output();
    
    // Test case 18
    in = 5'h11; #10; expected_out = 2'h1; check_output();
    
    // Test case 19
    in = 5'h12; #10; expected_out = 2'h0; check_output();
    
    // Test case 20
    in = 5'h13; #10; expected_out = 2'h3; check_output();
    
    // Test case 21
    in = 5'h14; #10; expected_out = 2'h3; check_output();
    
    // Test case 22
    in = 5'h15; #10; expected_out = 2'h2; check_output();
    
    // Test case 23
    in = 5'h16; #10; expected_out = 2'h0; check_output();
    
    // Test case 24
    in = 5'h17; #10; expected_out = 2'h2; check_output();
    
    // Test case 25
    in = 5'h18; #10; expected_out = 2'h0; check_output();
    
    // Test case 26
    in = 5'h19; #10; expected_out = 2'h0; check_output();
    
    // Test case 27
    in = 5'h1A; #10; expected_out = 2'h1; check_output();
    
    // Test case 28
    in = 5'h1B; #10; expected_out = 2'h2; check_output();
    
    // Test case 29
    in = 5'h1C; #10; expected_out = 2'h2; check_output();
    
    // Test case 30
    in = 5'h1D; #10; expected_out = 2'h1; check_output();
    
    // Test case 31
    in = 5'h1E; #10; expected_out = 2'h3; check_output();
    
    // Test case 32
    in = 5'h1F; #10; expected_out = 2'h1; check_output();
    
    $display("PASS");
    $finish;
end

task check_output;
    if (out !== expected_out) begin
        $display("FAIL: Expected %b but got %b for input %h", expected_out, out, in);
        $finish;
    end
endtask

endmodule