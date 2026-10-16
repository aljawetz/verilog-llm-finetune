`timescale 1ns/1ps

module tb_T_FF;

    reg clock;
    reg rst;
    reg t;
    wire q;
    wire q_bar;

    // Instantiate the T_FF module
    T_FF uut (
        .clock(clock),
        .rst(rst),
        .t(t),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1; // Assert reset
        t = 0;   // T input low
        #10;     // Wait for 10ns
        rst = 0; // Deassert reset

        // Check initial state after reset
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test toggling behavior
        t = 1; // Set T high
        #10;   // Wait for 1 clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Toggled state is incorrect after first toggle");
            $finish;
        end

        #10;   // Wait for 1 clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: Toggled state is incorrect after second toggle");
            $finish;
        end

        #10;   // Wait for 1 clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: Toggled state is incorrect after third toggle");
            $finish;
        end

        // Test holding state with T low
        t = 0; // Set T low
        #10;   // Wait for 1 clock cycle
        if (q !== 1 || q_bar !== 0) begin
            $display("FAIL: State should hold when T is low");
            $finish;
        end

        // Test reset functionality again
        rst = 1; // Assert reset
        #10;     // Wait for 1 clock cycle
        if (q !== 0 || q_bar !== 1) begin
            $display("FAIL: State after reset is incorrect");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule