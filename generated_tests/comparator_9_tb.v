`timescale 1ns/1ps

module tb_comparator;

    reg [3:0] count;
    reg [3:0] red_time;
    reg [3:0] yellow_time;
    reg [3:0] green_time;
    wire eq_red_time;
    wire eq_yellow_time;
    wire eq_green_time;

    // Instantiate the module under test (uut)
    comparator uut (
        .count(count),
        .red_time(red_time),
        .yellow_time(yellow_time),
        .green_time(green_time),
        .eq_red_time(eq_red_time),
        .eq_yellow_time(eq_yellow_time),
        .eq_green_time(eq_green_time)
    );

    initial begin
        // Test case 1: count equals red_time
        count = 4'b1010; red_time = 4'b1010; yellow_time = 4'b0011; green_time = 4'b0001;
        #10;
        if (eq_red_time !== 1'b1) begin
            $display("FAIL: Test case 1 failed, expected eq_red_time = 1");
            $finish;
        end

        // Test case 2: count equals yellow_time
        count = 4'b0011; red_time = 4'b1010; yellow_time = 4'b0011; green_time = 4'b0001;
        #10;
        if (eq_yellow_time !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected eq_yellow_time = 1");
            $finish;
        end

        // Test case 3: count equals green_time
        count = 4'b0001; red_time = 4'b1010; yellow_time = 4'b0011; green_time = 4'b0001;
        #10;
        if (eq_green_time !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected eq_green_time = 1");
            $finish;
        end

        // Test case 4: count does not equal any time
        count = 4'b1111; red_time = 4'b1010; yellow_time = 4'b0011; green_time = 4'b0001;
        #10;
        if (eq_red_time !== 1'b0 || eq_yellow_time !== 1'b0 || eq_green_time !== 1'b0) begin
            $display("FAIL: Test case 4 failed, expected all equals to 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule