`timescale 1ns/1ps

module tb_mux_2to1_8bit;

reg [7:0] a;
reg [7:0] b;
reg select;
wire [7:0] out;

// Instantiate the module under test (uut)
mux_2to1_8bit uut (
    .a(a),
    .b(b),
    .select(select),
    .out(out)
);

// Test sequence
initial begin
    // Test case 1: select = 0, expect out = a
    a = 8'b10101010; 
    b = 8'b01010101; 
    select = 1'b0; 
    #10; 
    if (out !== a) begin
        $display("FAIL: Test case 1 failed, expected out = %b, got out = %b", a, out);
        $finish;
    end

    // Test case 2: select = 1, expect out = b
    select = 1'b1; 
    #10; 
    if (out !== b) begin
        $display("FAIL: Test case 2 failed, expected out = %b, got out = %b", b, out);
        $finish;
    end

    // Test case 3: select = 0, change a, expect out = new a
    a = 8'b11110000; 
    select = 1'b0; 
    #10; 
    if (out !== a) begin
        $display("FAIL: Test case 3 failed, expected out = %b, got out = %b", a, out);
        $finish;
    end

    // Test case 4: select = 1, change b, expect out = new b
    b = 8'b00001111; 
    select = 1'b1; 
    #10; 
    if (out !== b) begin
        $display("FAIL: Test case 4 failed, expected out = %b, got out = %b", b, out);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule