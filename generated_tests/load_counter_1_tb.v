`timescale 1ns/1ps

module tb_load_counter;

    reg clk;
    reg arst;
    reg load;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    load_counter uut (
        .clk(clk),
        .arst(arst),
        .load(load),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        arst = 1;
        load = 0;
        #10; // Wait for 10ns
        arst = 0; // Release reset

        // Test 1: Check reset functionality
        if (count !== 4'b0000) begin
            $display("FAIL: Count not reset to 0");
            $finish;
        end

        // Test 2: Count up without load
        #10; // Wait for 10ns
        if (count !== 4'b0001) begin
            $display("FAIL: Count did not increment to 1");
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count did not increment to 2");
            $finish;
        end

        // Test 3: Load functionality
        load = 1; // Activate load
        #10; // Wait for 10ns
        load = 0; // Deactivate load
        if (count !== 4'b0010) begin
            $display("FAIL: Count changed when load is active");
            $finish;
        end

        // Test 4: Continue counting after load
        #10; // Wait for 10ns
        if (count !== 4'b0011) begin
            $display("FAIL: Count did not increment to 3 after load");
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 4'b0100) begin
            $display("FAIL: Count did not increment to 4");
            $finish;
        end

        // Test 5: Assert count wraps around
        uut.count = 4'b1111; // Manually set count to max
        #10; // Wait for 10ns
        if (count !== 4'b0000) begin
            $display("FAIL: Count did not wrap around to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule