`timescale 1ns/1ps

module tb_demux;

    reg [7:0] din;
    reg [1:0] sel;
    wire [7:0] dout0, dout1, dout2, dout3;

    // Instantiate the demux module
    demux #(8) uut (
        .din(din),
        .sel(sel),
        .dout0(dout0),
        .dout1(dout1),
        .dout2(dout2),
        .dout3(dout3)
    );

    initial begin
        // Test case 1: Select output 0
        din = 8'hAA; // Input data
        sel = 2'b00; // Select dout0
        #10;
        if (dout0 !== 8'hAA || dout1 !== 8'b0 || dout2 !== 8'b0 || dout3 !== 8'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Select output 1
        sel = 2'b01; // Select dout1
        #10;
        if (dout0 !== 8'b0 || dout1 !== 8'hAA || dout2 !== 8'b0 || dout3 !== 8'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Select output 2
        sel = 2'b10; // Select dout2
        #10;
        if (dout0 !== 8'b0 || dout1 !== 8'b0 || dout2 !== 8'hAA || dout3 !== 8'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Select output 3
        sel = 2'b11; // Select dout3
        #10;
        if (dout0 !== 8'b0 || dout1 !== 8'b0 || dout2 !== 8'b0 || dout3 !== 8'hAA) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule