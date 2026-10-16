`timescale 1ns/1ps

module tb_operator_B;

reg P;
reg G;
reg P1;
reg G1;
wire Po;
wire Go;

// Instantiate the module under test
operator_B uut (
    .P(P),
    .G(G),
    .P1(P1),
    .G1(G1),
    .Po(Po),
    .Go(Go)
);

// Test sequence
initial begin
    // Test case 1: Basic AND operation
    P = 1; G = 0; P1 = 1; G1 = 0;
    #10;
    if (Po !== 1'b1 || Go !== 1'b0) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Basic OR operation
    P = 0; G = 1; P1 = 0; G1 = 1;
    #10;
    if (Po !== 1'b0 || Go !== 1'b1) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Mixed inputs
    P = 1; G = 1; P1 = 0; G1 = 1;
    #10;
    if (Po !== 1'b0 || Go !== 1'b1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: All zeros
    P = 0; G = 0; P1 = 0; G1 = 0;
    #10;
    if (Po !== 1'b0 || Go !== 1'b0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: All ones
    P = 1; G = 1; P1 = 1; G1 = 1;
    #10;
    if (Po !== 1'b1 || Go !== 1'b1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule