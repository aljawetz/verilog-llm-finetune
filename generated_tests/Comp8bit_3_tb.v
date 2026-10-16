`timescale 1ns/1ps

module tb_Comp8bit;

reg [7:0] in1;
reg [7:0] in2;
wire le;
wire eq;
wire gr;

// Instantiate the module under test (uut)
Comp8bit uut (
    .in1(in1),
    .in2(in2),
    .le(le),
    .eq(eq),
    .gr(gr)
);

initial begin
    // Test case 1: in1 < in2
    in1 = 8'b00000001; // 1
    in2 = 8'b00000010; // 2
    #10;
    if (le !== 1'b1 || eq !== 1'b0 || gr !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: in1 == in2
    in1 = 8'b00000010; // 2
    in2 = 8'b00000010; // 2
    #10;
    if (le !== 1'b0 || eq !== 1'b1 || gr !== 1'b0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: in1 > in2
    in1 = 8'b00000100; // 4
    in2 = 8'b00000010; // 2
    #10;
    if (le !== 1'b0 || eq !== 1'b0 || gr !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: in1 = 0, in2 = 255
    in1 = 8'b00000000; // 0
    in2 = 8'b11111111; // 255
    #10;
    if (le !== 1'b1 || eq !== 1'b0 || gr !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: in1 = 255, in2 = 0
    in1 = 8'b11111111; // 255
    in2 = 8'b00000000; // 0
    #10;
    if (le !== 1'b0 || eq !== 1'b0 || gr !== 1'b1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule