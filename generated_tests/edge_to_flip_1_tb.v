`timescale 1ns/1ps

module tb_edge_to_flip;

    reg clk;
    reg rstn;
    reg data_in;
    wire flip_output;

    // Instantiate the module under test
    edge_to_flip uut (
        .clk(clk),
        .rstn(rstn),
        .data_in(data_in),
        .flip_output(flip_output)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rstn = 0;
        data_in = 0;

        // Apply reset
        #10;
        rstn = 1; // Release reset

        // Test case 1: Toggle on rising edge
        data_in = 1; // Rising edge should toggle flip_output
        #10;
        if (flip_output !== 1) begin
            $display("FAIL: Expected flip_output to be 1 after first rising edge");
            $finish;
        end

        // Test case 2: No toggle on low state
        data_in = 0; // No toggle expected
        #10;
        if (flip_output !== 1) begin
            $display("FAIL: Expected flip_output to remain 1 when data_in is low");
            $finish;
        end

        // Test case 3: Toggle on next rising edge
        data_in = 1; // Rising edge should toggle flip_output
        #10;
        if (flip_output !== 0) begin
            $display("FAIL: Expected flip_output to be 0 after second rising edge");
            $finish;
        end

        // Test case 4: Reset functionality
        rstn = 0; // Assert reset
        #10;
        if (flip_output !== 0) begin
            $display("FAIL: Expected flip_output to be 0 after reset");
            $finish;
        end
        rstn = 1; // Release reset

        // Test case 5: Toggle on rising edge after reset
        data_in = 1; // Rising edge should toggle flip_output
        #10;
        if (flip_output !== 1) begin
            $display("FAIL: Expected flip_output to be 1 after rising edge post-reset");
            $finish;
        end

        // Test case 6: No toggle on low state
        data_in = 0; // No toggle expected
        #10;
        if (flip_output !== 1) begin
            $display("FAIL: Expected flip_output to remain 1 when data_in is low");
            $finish;
        end

        // Test case 7: Toggle on next rising edge
        data_in = 1; // Rising edge should toggle flip_output
        #10;
        if (flip_output !== 0) begin
            $display("FAIL: Expected flip_output to be 0 after third rising edge");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule