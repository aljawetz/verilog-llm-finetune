`timescale 1ns/1ps

module tb_priority_encoder_casx;

    reg [3:0] i;
    wire [1:0] y_out;

    // Instantiate the module under test (uut)
    priority_encoder_casx uut (
        .i(i),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: Highest priority bit is 1
        i = 4'b1000; #10;
        if (y_out !== 2'b11) begin
            $display("FAIL: Test case 1 failed, expected 2'b11, got %b", y_out);
            $finish;
        end

        // Test case 2: Second highest priority bit is 1
        i = 4'b0100; #10;
        if (y_out !== 2'b10) begin
            $display("FAIL: Test case 2 failed, expected 2'b10, got %b", y_out);
            $finish;
        end

        // Test case 3: Third highest priority bit is 1
        i = 4'b0010; #10;
        if (y_out !== 2'b01) begin
            $display("FAIL: Test case 3 failed, expected 2'b01, got %b", y_out);
            $finish;
        end

        // Test case 4: Lowest priority bit is 1
        i = 4'b0001; #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Test case 4 failed, expected 2'b00, got %b", y_out);
            $finish;
        end

        // Test case 5: All bits are 0
        i = 4'b0000; #10;
        if (y_out !== 2'bxx) begin
            $display("FAIL: Test case 5 failed, expected 2'bxx, got %b", y_out);
            $finish;
        end

        // Test case 6: Mixed input with don't care
        i = 4'b1x00; #10;
        if (y_out !== 2'b11) begin
            $display("FAIL: Test case 6 failed, expected 2'b11, got %b", y_out);
            $finish;
        end

        // Test case 7: Mixed input with don't care
        i = 4'b01x0; #10;
        if (y_out !== 2'b10) begin
            $display("FAIL: Test case 7 failed, expected 2'b10, got %b", y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule