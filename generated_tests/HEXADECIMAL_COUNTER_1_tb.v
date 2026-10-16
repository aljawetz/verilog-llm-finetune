`timescale 1ns/1ps

module tb_HEXADECIMAL_COUNTER;

    reg CLK;
    reg RESET;
    wire [2:0] Q;

    // Instantiate the module under test (uut)
    HEXADECIMAL_COUNTER uut (
        .CLK(CLK),
        .RESET(RESET),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        RESET = 1; // Assert reset
        #10; // Wait for 10ns
        RESET = 0; // Deassert reset

        // Test counting up to 5
        #10; // Wait for 10ns
        if (Q !== 3'b001) $display("FAIL: Expected Q=001, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b010) $display("FAIL: Expected Q=010, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b011) $display("FAIL: Expected Q=011, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b100) $display("FAIL: Expected Q=100, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b101) $display("FAIL: Expected Q=101, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b000) $display("FAIL: Expected Q=000 after reaching 101, got Q=%b", Q);

        // Test reset functionality
        RESET = 1; // Assert reset
        #10; // Wait for 10ns
        if (Q !== 3'b000) $display("FAIL: Expected Q=000 after reset, got Q=%b", Q);
        
        RESET = 0; // Deassert reset
        #10; // Wait for 10ns
        if (Q !== 3'b001) $display("FAIL: Expected Q=001 after reset, got Q=%b", Q);

        // Test counting to 5 again
        #40; // Wait for 40ns
        if (Q !== 3'b101) $display("FAIL: Expected Q=101, got Q=%b", Q);
        
        #10; // Wait for 10ns
        if (Q !== 3'b000) $display("FAIL: Expected Q=000 after reaching 101, got Q=%b", Q);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule