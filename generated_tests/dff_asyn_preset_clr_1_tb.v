`timescale 1ns/1ps

module tb_dff_asyn_preset_clr;

    reg clk;
    reg d;
    reg preset;
    reg clear;
    wire q;

    // Instantiate the module under test
    dff_asyn_preset_clr uut (
        .clk(clk),
        .d(d),
        .preset(preset),
        .clear(clear),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0;
        preset = 0;
        clear = 0;

        // Test 1: Check clear functionality
        clear = 1; #10; // Assert clear
        if (q !== 1'b0) begin
            $display("FAIL: Clear did not set q to 0");
            $finish;
        end
        clear = 0; #10; // Deassert clear

        // Test 2: Check preset functionality
        preset = 1; #10; // Assert preset
        if (q !== 1'b1) begin
            $display("FAIL: Preset did not set q to 1");
            $finish;
        end
        preset = 0; #10; // Deassert preset

        // Test 3: Check D input functionality
        d = 1; #10; // Set d to 1
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d on rising edge");
            $finish;
        end
        d = 0; #10; // Set d to 0
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow d on rising edge");
            $finish;
        end

        // Test 4: Check that preset overrides D
        d = 1; preset = 1; #10; // Assert preset while d is 1
        if (q !== 1'b1) begin
            $display("FAIL: Preset should override d");
            $finish;
        end
        preset = 0; #10; // Deassert preset

        // Test 5: Check that clear overrides D
        d = 1; clear = 1; #10; // Assert clear while d is 1
        if (q !== 1'b0) begin
            $display("FAIL: Clear should override d");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule