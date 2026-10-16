`timescale 1ns/1ps

module tb_clk_div;

    reg clk;
    reg rst_n;
    reg [15:0] lcd_id;
    wire lcd_pclk;

    // Instantiate the module under test
    clk_div uut (
        .clk(clk),
        .rst_n(rst_n),
        .lcd_id(lcd_id),
        .lcd_pclk(lcd_pclk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50MHz clock
    end

    // Test sequence
    initial begin
        // Initialize
        rst_n = 0;
        lcd_id = 16'h0000;
        #20; // Wait for some time
        
        // Release reset
        rst_n = 1;
        #20; // Wait for clock to stabilize

        // Test case 1: Check lcd_pclk for lcd_id = 16'h4342 (12.5MHz)
        lcd_id = 16'h4342;
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== uut.clk_12_5m) begin
            $display("FAIL: lcd_id = 16'h4342 did not produce 12.5MHz clock");
            $finish;
        end

        // Test case 2: Check lcd_pclk for lcd_id = 16'h7084 (25MHz)
        lcd_id = 16'h7084;
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== uut.clk_25m) begin
            $display("FAIL: lcd_id = 16'h7084 did not produce 25MHz clock");
            $finish;
        end

        // Test case 3: Check lcd_pclk for lcd_id = 16'h7016 (50MHz)
        lcd_id = 16'h7016;
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== clk) begin
            $display("FAIL: lcd_id = 16'h7016 did not produce 50MHz clock");
            $finish;
        end

        // Test case 4: Check lcd_pclk for lcd_id = 16'h4384 (25MHz)
        lcd_id = 16'h4384;
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== uut.clk_25m) begin
            $display("FAIL: lcd_id = 16'h4384 did not produce 25MHz clock");
            $finish;
        end

        // Test case 5: Check lcd_pclk for lcd_id = 16'h1018 (50MHz)
        lcd_id = 16'h1018;
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== clk) begin
            $display("FAIL: lcd_id = 16'h1018 did not produce 50MHz clock");
            $finish;
        end

        // Test case 6: Check default case
        lcd_id = 16'hFFFF; // Default case
        #100; // Wait for a few clock cycles
        if (lcd_pclk !== 1'b0) begin
            $display("FAIL: default lcd_id did not produce 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule