`timescale 1ns/1ps

module tb_D;

reg D;
reg CLK;
reg RST;
wire Q;

D uut (
    .D(D),
    .CLK(CLK),
    .RST(RST),
    .Q(Q)
);

initial begin
    // Initialize signals
    D = 0;
    CLK = 0;
    RST = 0;

    // Test sequence
    // Test 1: Check reset functionality
    RST = 1; #5; // Assert reset
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when RST is high");
        $finish;
    end
    RST = 0; #5; // Deassert reset

    // Test 2: Check D input on rising edge of CLK
    D = 1; #10; // Wait for a clock edge
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after D is set to 1");
        $finish;
    end

    D = 0; #10; // Wait for a clock edge
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after D is set to 0");
        $finish;
    end

    // Test 3: Check reset during operation
    D = 1; #5; // Set D to 1
    RST = 1; #5; // Assert reset
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 when RST is high");
        $finish;
    end
    RST = 0; #5; // Deassert reset

    // Test 4: Check D input again after reset
    D = 1; #10; // Wait for a clock edge
    if (Q !== 1) begin
        $display("FAIL: Q should be 1 after D is set to 1 again");
        $finish;
    end

    // Test 5: Final check with multiple clock cycles
    D = 0; #10; // Wait for a clock edge
    if (Q !== 0) begin
        $display("FAIL: Q should be 0 after D is set to 0 again");
        $finish;
    end

    $display("PASS");
    $finish;
end

// Clock generation
always #5 CLK = ~CLK;

endmodule