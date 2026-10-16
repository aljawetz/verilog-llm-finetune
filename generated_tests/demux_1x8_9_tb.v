`timescale 1ns/1ps

module tb_demux_1x8;

    reg din;
    reg [2:0] sel;
    wire [7:0] dout;

    // Instantiate the module under test (uut)
    demux_1x8 uut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        // Initialize inputs
        din = 0;
        sel = 3'b000;

        // Test case 1: Select output 0
        din = 1;
        sel = 3'b000;
        #10;
        if (dout !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select output 1
        din = 1;
        sel = 3'b001;
        #10;
        if (dout !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select output 2
        din = 1;
        sel = 3'b010;
        #10;
        if (dout !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select output 3
        din = 1;
        sel = 3'b011;
        #10;
        if (dout !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Select output 4
        din = 1;
        sel = 3'b100;
        #10;
        if (dout !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Select output 5
        din = 1;
        sel = 3'b101;
        #10;
        if (dout !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Select output 6
        din = 1;
        sel = 3'b110;
        #10;
        if (dout !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Select output 7
        din = 1;
        sel = 3'b111;
        #10;
        if (dout !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: Check all outputs are zero when din is 0
        din = 0;
        sel = 3'b000;
        #10;
        if (dout !== 8'b00000000) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule