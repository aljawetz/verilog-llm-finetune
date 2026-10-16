`timescale 1ns/1ps

module tb_demux1_8_bh;

    reg in;
    reg [2:0] sel;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    demux1_8_bh uut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1: Select output 0
        in = 1'b1; sel = 3'b000; #10;
        if (y !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected y = 8'b00000001, got y = %b", y);
            $finish;
        end

        // Test case 2: Select output 1
        in = 1'b1; sel = 3'b001; #10;
        if (y !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected y = 8'b00000010, got y = %b", y);
            $finish;
        end

        // Test case 3: Select output 2
        in = 1'b1; sel = 3'b010; #10;
        if (y !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected y = 8'b00000100, got y = %b", y);
            $finish;
        end

        // Test case 4: Select output 3
        in = 1'b1; sel = 3'b011; #10;
        if (y !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected y = 8'b00001000, got y = %b", y);
            $finish;
        end

        // Test case 5: Select output 4
        in = 1'b1; sel = 3'b100; #10;
        if (y !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected y = 8'b00010000, got y = %b", y);
            $finish;
        end

        // Test case 6: Select output 5
        in = 1'b1; sel = 3'b101; #10;
        if (y !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected y = 8'b00100000, got y = %b", y);
            $finish;
        end

        // Test case 7: Select output 6
        in = 1'b1; sel = 3'b110; #10;
        if (y !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected y = 8'b01000000, got y = %b", y);
            $finish;
        end

        // Test case 8: Select output 7
        in = 1'b1; sel = 3'b111; #10;
        if (y !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected y = 8'b10000000, got y = %b", y);
            $finish;
        end

        // Test case 9: Check with in = 0
        in = 1'b0; sel = 3'b000; #10;
        if (y !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed, expected y = 8'b00000000, got y = %b", y);
            $finish;
        end

        // Test case 10: Check default case
        in = 1'b1; sel = 3'bxxx; #10; // Invalid select
        if (y !== 8'bxxxxxxxx) begin
            $display("FAIL: Test case 10 failed, expected y = 8'bxxxxxxxx, got y = %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule