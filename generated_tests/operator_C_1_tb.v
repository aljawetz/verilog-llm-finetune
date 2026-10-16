`timescale 1ns/1ps

module tb_operator_C;

reg P;
reg G;
reg G1;
wire Go;

// Instantiate the module under test (uut)
operator_C uut (
    .P(P),
    .G(G),
    .G1(G1),
    .Go(Go)
);

// Test sequence
initial begin
    // Initialize inputs
    P = 0; G = 0; G1 = 0;

    // Test case 1: All inputs low
    #10;
    if (Go !== 0) begin
        $display("FAIL: Test case 1 failed, expected Go=0, got Go=%b", Go);
        $finish;
    end

    // Test case 2: G is high
    G = 1;
    #10;
    if (Go !== 1) begin
        $display("FAIL: Test case 2 failed, expected Go=1, got Go=%b", Go);
        $finish;
    end

    // Test case 3: P is high, G1 is low
    P = 1; G = 0; G1 = 0;
    #10;
    if (Go !== 0) begin
        $display("FAIL: Test case 3 failed, expected Go=0, got Go=%b", Go);
        $finish;
    end

    // Test case 4: P is high, G1 is high
    G1 = 1;
    #10;
    if (Go !== 1) begin
        $display("FAIL: Test case 4 failed, expected Go=1, got Go=%b", Go);
        $finish;
    end

    // Test case 5: P is low, G is high, G1 is high
    P = 0; G = 1; G1 = 1;
    #10;
    if (Go !== 1) begin
        $display("FAIL: Test case 5 failed, expected Go=1, got Go=%b", Go);
        $finish;
    end

    // Test case 6: All inputs high
    P = 1; G = 1; G1 = 1;
    #10;
    if (Go !== 1) begin
        $display("FAIL: Test case 6 failed, expected Go=1, got Go=%b", Go);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule