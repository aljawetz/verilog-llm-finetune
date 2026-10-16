`timescale 1ns/1ps

module tb_example;

    // Testbench signals
    reg clk;
    reg reset;
    reg x;
    wire output_signal;

    // Instantiate the module under test (uut)
    example uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .output_signal(output_signal)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        x = 0;
        #10;  // Wait for 10ns
        reset = 0;

        // Test state transitions and output
        // State S0
        if (output_signal !== 1'b1) begin
            $display("FAIL: Expected output_signal = 1'b1 in state S0");
            $finish;
        end
        
        // Transition to S1
        x = 0; #10;  // S0 -> S1
        if (output_signal !== 1'b1) begin
            $display("FAIL: Expected output_signal = 1'b1 in state S1");
            $finish;
        end
        
        // Transition to S3
        x = 0; #10;  // S1 -> S3
        if (output_signal !== 1'b1) begin
            $display("FAIL: Expected output_signal = 1'b1 in state S3");
            $finish;
        end
        
        // Transition to S1
        x = 0; #10;  // S3 -> S1
        if (output_signal !== 1'b1) begin
            $display("FAIL: Expected output_signal = 1'b1 in state S1");
            $finish;
        end
        
        // Transition to S5
        x = 1; #10;  // S1 -> S5
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S5");
            $finish;
        end
        
        // Transition to S4
        x = 0; #10;  // S5 -> S4
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S4");
            $finish;
        end
        
        // Transition to S2
        x = 1; #10;  // S4 -> S2
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S2");
            $finish;
        end
        
        // Transition to S5
        x = 0; #10;  // S2 -> S5
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S5");
            $finish;
        end
        
        // Transition to S3
        x = 1; #10;  // S5 -> S3
        if (output_signal !== 1'b1) begin
            $display("FAIL: Expected output_signal = 1'b1 in state S3");
            $finish;
        end
        
        // Transition to S6
        x = 1; #10;  // S3 -> S6
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S6");
            $finish;
        end
        
        // Transition to S5
        x = 0; #10;  // S6 -> S5
        if (output_signal !== 1'b0) begin
            $display("FAIL: Expected output_signal = 1'b0 in state S5");
            $finish;
        end
        
        // End of test
        $display("PASS");
        $finish;
    end

endmodule