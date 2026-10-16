`timescale 1ns/1ps

module tb_piso_left_cyclic_Nb;

    parameter BUS_WIDTH = 8;
    parameter SISO_WIDTH = 4;

    reg RST;
    reg CLK;
    reg LOAD;
    reg LSHIFT;
    reg [BUS_WIDTH-1:0] IN0, IN1, IN2, IN3;
    wire [BUS_WIDTH-1:0] OUT;

    piso_left_cyclic_Nb #(BUS_WIDTH, SISO_WIDTH) uut (
        .RST(RST),
        .CLK(CLK),
        .LOAD(LOAD),
        .LSHIFT(LSHIFT),
        .IN0(IN0),
        .IN1(IN1),
        .IN2(IN2),
        .IN3(IN3),
        .OUT(OUT)
    );

    initial begin
        // Initialize signals
        RST = 1;
        CLK = 0;
        LOAD = 0;
        LSHIFT = 0;
        IN0 = 8'h00;
        IN1 = 8'h00;
        IN2 = 8'h00;
        IN3 = 8'h00;

        // Release reset
        #10 RST = 0;

        // Test 1: Load values into the register
        LOAD = 1;
        IN0 = 8'hAA; // 10101010
        IN1 = 8'hBB; // 10111011
        IN2 = 8'hCC; // 11001100
        IN3 = 8'hDD; // 11011101
        #10 LOAD = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hDD) $display("FAIL: Expected OUT = 8'hDD after loading, got OUT = %h", OUT);

        // Test 2: Shift left
        LSHIFT = 1;
        #10 LSHIFT = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hAA) $display("FAIL: Expected OUT = 8'hAA after left shift, got OUT = %h", OUT);

        // Test 3: Shift left again
        LSHIFT = 1;
        #10 LSHIFT = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hBB) $display("FAIL: Expected OUT = 8'hBB after left shift, got OUT = %h", OUT);

        // Test 4: Shift left again
        LSHIFT = 1;
        #10 LSHIFT = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hCC) $display("FAIL: Expected OUT = 8'hCC after left shift, got OUT = %h", OUT);

        // Test 5: Shift left again
        LSHIFT = 1;
        #10 LSHIFT = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hDD) $display("FAIL: Expected OUT = 8'hDD after left shift, got OUT = %h", OUT);

        // Test 6: Reset the module
        RST = 1;
        #10 RST = 0;

        // Wait for one clock cycle
        #10;
        if (OUT !== 8'hDD) $display("FAIL: Expected OUT = 8'hDD after reset, got OUT = %h", OUT);

        // End of tests
        $display("PASS");
        $finish;
    end

    always #5 CLK = ~CLK; // Generate clock

endmodule