`timescale 1ns/1ps

module tb_demux_1to4_1;

    reg a;
    reg [1:0] s;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    demux_1to4_1 uut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select output 0
        a = 1'b1; s = 2'b00; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 1 failed, expected y=0001, got y=%b", y);
            $finish;
        end

        // Test case 2: Select output 1
        a = 1'b1; s = 2'b01; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected y=0010, got y=%b", y);
            $finish;
        end

        // Test case 3: Select output 2
        a = 1'b1; s = 2'b10; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected y=0100, got y=%b", y);
            $finish;
        end

        // Test case 4: Select output 3
        a = 1'b1; s = 2'b11; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 4 failed, expected y=1000, got y=%b", y);
            $finish;
        end

        // Test case 5: Check with a = 0
        a = 1'b0; s = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 5 failed, expected y=0000, got y=%b", y);
            $finish;
        end

        // Test case 6: Check with a = 0 and different selectors
        a = 1'b0; s = 2'b01; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected y=0000, got y=%b", y);
            $finish;
        end

        a = 1'b0; s = 2'b10; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 7 failed, expected y=0000, got y=%b", y);
            $finish;
        end

        a = 1'b0; s = 2'b11; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 8 failed, expected y=0000, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule