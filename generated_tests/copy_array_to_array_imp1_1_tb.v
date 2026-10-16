`timescale 1ns/1ps

module tb_copy_array_to_array_imp1;

    // Parameters
    reg Reset;
    reg Clk;
    reg Start;
    reg Ack;
    reg [3:0] Ms_of_I;
    wire Ns_of_J_Write;
    wire [3:0] I;
    wire [3:0] J;

    // Instantiate the Unit Under Test (UUT)
    copy_array_to_array_imp1 uut (
        .Reset(Reset),
        .Clk(Clk),
        .Start(Start),
        .Ack(Ack),
        .Ms_of_I(Ms_of_I),
        .Ns_of_J_Write(Ns_of_J_Write),
        .I(I),
        .J(J)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        Reset = 1;
        Start = 0;
        Ack = 0;
        Ms_of_I = 4'b0000;

        // Release reset
        #10;
        Reset = 0;

        // Test case 1: Start the operation
        #10;
        Start = 1; // Start the state machine
        #10;
        Start = 0; // Clear Start

        // Test case 2: Check initial values of I and J
        #10;
        if (I !== 4'b0000 || J !== 4'b0000) begin
            $display("FAIL: Initial values of I and J are incorrect");
            $finish;
        end

        // Test case 3: Provide values for Ms_of_I and check Ns_of_J_Write
        // Test with Ms_of_I[3] = 1 (should write)
        #10;
        Ms_of_I = 4'b1001; // MSB is 1
        #10;
        if (Ns_of_J_Write !== 1) begin
            $display("FAIL: Ns_of_J_Write should be high when Ms_of_I[3] is 1");
            $finish;
        end

        // Test case 4: Provide values for Ms_of_I and check Ns_of_J_Write
        // Test with Ms_of_I[3] = 0 (should not write)
        #10;
        Ms_of_I = 4'b0110; // MSB is 0
        #10;
        if (Ns_of_J_Write !== 0) begin
            $display("FAIL: Ns_of_J_Write should be low when Ms_of_I[3] is 0");
            $finish;
        end

        // Test case 5: Simulate Ack and check state transition
        #10;
        Ack = 1; // Acknowledge the operation
        #10;
        Ack = 0; // Clear Ack

        // Test case 6: Check if state resets correctly
        #10;
        if (I !== 4'b0000 || J !== 4'b0000) begin
            $display("FAIL: I and J should reset to 0 after Ack");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule