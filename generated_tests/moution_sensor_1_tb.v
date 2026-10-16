`timescale 1ns/1ps

module tb_moution_sensor;

    reg CLOCK_50;
    reg [35:0] GPIO_0;
    wire [7:0] LEDG;
    wire [9:0] LEDR;

    // Instantiate the module under test (uut)
    moution_sensor uut (
        .CLOCK_50(CLOCK_50),
        .GPIO_0(GPIO_0),
        .LEDG(LEDG),
        .LEDR(LEDR)
    );

    // Clock generation
    initial begin
        CLOCK_50 = 0;
        forever #10 CLOCK_50 = ~CLOCK_50; // 50MHz clock
    end

    initial begin
        // Initialize GPIO_0
        GPIO_0 = 36'b0;

        // Test case 1: GPIO_0[0] = 1
        GPIO_0[0] = 1; // Set GPIO_0[0] high
        #20; // Wait for two clock cycles
        if (LEDG !== 8'b11111111 || LEDR !== 10'b0000000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: GPIO_0[0] = 0
        GPIO_0[0] = 0; // Set GPIO_0[0] low
        #20; // Wait for two clock cycles
        if (LEDG !== 8'b00000000 || LEDR !== 10'b1111111111) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: GPIO_0[0] = 1 again
        GPIO_0[0] = 1; // Set GPIO_0[0] high
        #20; // Wait for two clock cycles
        if (LEDG !== 8'b11111111 || LEDR !== 10'b0000000000) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: GPIO_0[0] = 0 again
        GPIO_0[0] = 0; // Set GPIO_0[0] low
        #20; // Wait for two clock cycles
        if (LEDG !== 8'b00000000 || LEDR !== 10'b1111111111) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule