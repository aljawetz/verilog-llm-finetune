`timescale 1ns/1ps

module tb_arith;

reg [15:0] a;
reg [15:0] b;
reg [2:0] opcode;
wire [31:0] outau;

// Instantiate the module under test (uut)
arith uut (
    .a(a),
    .b(b),
    .opcode(opcode),
    .outau(outau)
);

initial begin
    // Test case 1: Addition
    a = 16'h0001; b = 16'h0002; opcode = 3'b000; // 1 + 2
    #10;
    if (outau !== 32'h00000003) begin
        $display("FAIL: Addition test failed");
        $finish;
    end

    // Test case 2: Multiplication
    a = 16'h0003; b = 16'h0004; opcode = 3'b001; // 3 * 4
    #10;
    if (outau !== 32'h0000000C) begin
        $display("FAIL: Multiplication test failed");
        $finish;
    end

    // Test case 3: Subtraction (a > b)
    a = 16'h0005; b = 16'h0002; opcode = 3'b010; // 5 - 2
    #10;
    if (outau !== 32'h00000003) begin
        $display("FAIL: Subtraction test failed");
        $finish;
    end

    // Test case 4: Subtraction (b > a)
    a = 16'h0002; b = 16'h0005; opcode = 3'b010; // 5 - 2
    #10;
    if (outau !== 32'h00000003) begin
        $display("FAIL: Subtraction test failed");
        $finish;
    end

    // Test case 5: Division (a > b)
    a = 16'h0006; b = 16'h0002; opcode = 3'b011; // 6 / 2
    #10;
    if (outau !== 32'h00000003) begin
        $display("FAIL: Division test failed");
        $finish;
    end

    // Test case 6: Division (b > a)
    a = 16'h0002; b = 16'h0006; opcode = 3'b011; // 6 / 2
    #10;
    if (outau !== 32'h00000003) begin
        $display("FAIL: Division test failed");
        $finish;
    end

    // Test case 7: Default case
    a = 16'h0000; b = 16'h0000; opcode = 3'b111; // Default case
    #10;
    if (outau !== 32'h00000000) begin
        $display("FAIL: Default case test failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule