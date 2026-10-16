`timescale 1ns/1ps

module tb_register5_wlh;

    reg [4:0] datain;
    reg load;
    reg hold;
    reg clock;
    wire [4:0] dataout;

    // Instantiate the module under test (uut)
    register5_wlh uut (
        .datain(datain),
        .dataout(dataout),
        .load(load),
        .hold(hold),
        .clock(clock)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        load = 0;
        hold = 0;
        datain = 5'b00000;

        // Test 1: Reset condition (hold not asserted, load not asserted)
        #10;
        if (dataout !== 5'b00000) begin
            $display("FAIL: Expected dataout to be 00000 after reset");
            $finish;
        end

        // Test 2: Load data
        load = 1;
        datain = 5'b10101; // Load 10101
        #10;
        load = 0; // Release load
        if (dataout !== 5'b10101) begin
            $display("FAIL: Expected dataout to be 10101 after loading");
            $finish;
        end

        // Test 3: Hold condition
        hold = 1; // Assert hold
        #10;
        if (dataout !== 5'b10101) begin
            $display("FAIL: Expected dataout to remain 10101 while holding");
            $finish;
        end

        // Test 4: Reset condition (hold not asserted, load not asserted)
        hold = 0; // Release hold
        #10;
        if (dataout !== 5'b00000) begin
            $display("FAIL: Expected dataout to be 00000 after reset");
            $finish;
        end

        // Test 5: Load new data
        load = 1;
        datain = 5'b11111; // Load 11111
        #10;
        load = 0; // Release load
        if (dataout !== 5'b11111) begin
            $display("FAIL: Expected dataout to be 11111 after loading");
            $finish;
        end

        // Test 6: Reset condition again
        #10;
        if (dataout !== 5'b00000) begin
            $display("FAIL: Expected dataout to be 00000 after reset");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule