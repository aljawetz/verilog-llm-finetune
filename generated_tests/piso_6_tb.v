`timescale 1ns/1ps

module tb_piso;

    reg clk;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;

    // Instantiate the module under test (uut)
    piso uut (
        .clk(clk),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        load = 0;
        parallel_in = 4'b0000;

        // Test 1: Load data into shift register
        load = 1;
        parallel_in = 4'b1010; // Load 1010
        #10; // Wait for one clock cycle
        load = 0; // Disable load

        // Test 2: Shift and check serial output
        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b0) begin
            $display("FAIL: Expected serial_out to be 0, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b0) begin
            $display("FAIL: Expected serial_out to be 0, got %b", serial_out);
            $finish;
        end

        // Test 3: Load new data
        load = 1;
        parallel_in = 4'b1111; // Load 1111
        #10; // Wait for one clock cycle
        load = 0; // Disable load

        // Test 4: Shift and check serial output
        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (serial_out !== 1'b1) begin
            $display("FAIL: Expected serial_out to be 1, got %b", serial_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule