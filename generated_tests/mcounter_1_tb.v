`timescale 1ns/1ps

module tb_mcounter;
    reg [3:0] data;
    reg rst;
    reg load;
    reg clk;
    wire [3:0] q;

    // Instantiate the module under test (uut)
    mcounter uut (
        .data(data),
        .rst(rst),
        .load(load),
        .clk(clk),
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
        rst = 1;
        load = 0;
        data = 4'b0000;

        // Wait for a clock cycle
        #10;

        // Release reset
        rst = 0;

        // Test loading data
        data = 4'b0001; load = 1; #10; load = 0; // Load 1
        if (q !== 4'b0001) $display("FAIL: Expected q = 1 after loading 1, got %b", q);

        // Increment until 12
        repeat (11) begin
            #10; // Wait for clock
            if (q !== (q + 1)) $display("FAIL: Expected q = %b after increment, got %b", q + 1, q);
        end

        // Check reset at 12
        #10; // Wait for clock
        if (q !== 4'b0000) $display("FAIL: Expected q = 0 after reaching 12, got %b", q);

        // Test loading data again
        data = 4'b0010; load = 1; #10; load = 0; // Load 2
        if (q !== 4'b0010) $display("FAIL: Expected q = 2 after loading 2, got %b", q);

        // Increment until 12 again
        repeat (11) begin
            #10; // Wait for clock
            if (q !== (q + 1)) $display("FAIL: Expected q = %b after increment, got %b", q + 1, q);
        end

        // Check reset at 12 again
        #10; // Wait for clock
        if (q !== 4'b0000) $display("FAIL: Expected q = 0 after reaching 12, got %b", q);

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule