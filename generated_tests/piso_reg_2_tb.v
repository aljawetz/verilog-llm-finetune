`timescale 1ns/1ps

module tb_piso_reg;

    reg Clk;
    reg load;
    reg [3:0] Parallel_In;
    wire Serial_Out;

    // Instantiate the module under test (uut)
    piso_reg uut (
        .Clk(Clk),
        .Parallel_In(Parallel_In),
        .load(load),
        .Serial_Out(Serial_Out)
    );

    // Clock generation
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        load = 0;
        Parallel_In = 4'b0000;

        // Test 1: Load data into the register
        Parallel_In = 4'b1010; // Load 1010
        load = 1; // Assert load
        #10; // Wait for one clock cycle
        load = 0; // Deassert load
        #10; // Wait for another clock cycle

        // Check output after loading
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        // Test 2: Shift left and check outputs
        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b0) begin
            $display("FAIL: Expected Serial_Out = 0, got %b", Serial_Out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b0) begin
            $display("FAIL: Expected Serial_Out = 0, got %b", Serial_Out);
            $finish;
        end

        // Test 3: Load new data and check outputs
        Parallel_In = 4'b1111; // Load 1111
        load = 1; // Assert load
        #10; // Wait for one clock cycle
        load = 0; // Deassert load
        #10; // Wait for another clock cycle

        // Check output after loading new data
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        #10; // Wait for next clock cycle
        if (Serial_Out !== 1'b1) begin
            $display("FAIL: Expected Serial_Out = 1, got %b", Serial_Out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule