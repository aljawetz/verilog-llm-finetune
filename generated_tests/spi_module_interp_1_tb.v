`timescale 1ns/1ps

module tb_spi_module_interp;

    reg [9:0] din0, din1, din2, din3;
    reg CLK, Reset, load;
    wire [9:0] dout;

    // Instantiate the module under test
    spi_module_interp uut (
        .din0(din0),
        .din1(din1),
        .din2(din2),
        .din3(din3),
        .CLK(CLK),
        .Reset(Reset),
        .load(load),
        .dout(dout)
    );

    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        Reset = 1;
        load = 0;
        din0 = 10'd0;
        din1 = 10'd0;
        din2 = 10'd0;
        din3 = 10'd0;

        // Release reset
        #10 Reset = 0;

        // Test case 1: Load values and check output
        din0 = 10'd1; din1 = 10'd2; din2 = 10'd3; din3 = 10'd4;
        load = 1;
        #10 load = 0;

        // Check outputs in reverse order
        #10 if (dout !== 10'd4) $display("FAIL: Expected dout=4, got dout=%d", dout);
        #10 if (dout !== 10'd3) $display("FAIL: Expected dout=3, got dout=%d", dout);
        #10 if (dout !== 10'd2) $display("FAIL: Expected dout=2, got dout=%d", dout);
        #10 if (dout !== 10'd1) $display("FAIL: Expected dout=1, got dout=%d", dout);

        // Test case 2: Reset functionality
        #10 Reset = 1;
        #10 if (dout !== 10'd0) $display("FAIL: Expected dout=0 after reset, got dout=%d", dout);

        // Test case 3: Load new values
        Reset = 0;
        din0 = 10'd5; din1 = 10'd6; din2 = 10'd7; din3 = 10'd8;
        load = 1;
        #10 load = 0;

        // Check outputs in reverse order
        #10 if (dout !== 10'd8) $display("FAIL: Expected dout=8, got dout=%d", dout);
        #10 if (dout !== 10'd7) $display("FAIL: Expected dout=7, got dout=%d", dout);
        #10 if (dout !== 10'd6) $display("FAIL: Expected dout=6, got dout=%d", dout);
        #10 if (dout !== 10'd5) $display("FAIL: Expected dout=5, got dout=%d", dout);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule