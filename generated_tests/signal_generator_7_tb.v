`timescale 1ns/1ps

module tb_signal_generator;

    reg clk;
    reg rst_n;
    wire [4:0] wave;

    // Instantiate the module under test (uut)
    signal_generator uut (
        .clk(clk),
        .rst_n(rst_n),
        .wave(wave)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst_n = 0;
        #10; // Hold reset for 10ns
        rst_n = 1; // Release reset

        // Wait for the wave to increment to 31
        wait(wave == 5'b11111); // Wait until wave reaches 31
        #10; // Allow some time for the state to change

        // Check if wave is 31
        if (wave !== 5'b11111) begin
            $display("FAIL: Expected wave to be 31 after incrementing.");
            $finish;
        end

        // Wait for the wave to decrement to 0
        wait(wave == 5'b00000); // Wait until wave reaches 0
        #10; // Allow some time for the state to change

        // Check if wave is 0
        if (wave !== 5'b00000) begin
            $display("FAIL: Expected wave to be 0 after decrementing.");
            $finish;
        end

        // Test completed successfully
        $display("PASS");
        $finish;
    end

endmodule