`timescale 1ns/1ps

module tb_demux1_N;

parameter N = 16;

reg in;
reg [$clog2(N)-1:0] sel;
wire [N-1:0] out;

demux1_N uut (
    .in(in),
    .sel(sel),
    .out(out)
);

initial begin
    // Initialize inputs
    in = 0;
    sel = 0;

    // Test case 1: Select output 0
    in = 1;
    sel = 0;
    #10;
    if (out !== 16'b0000000000000001) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Select output 1
    in = 1;
    sel = 1;
    #10;
    if (out !== 16'b0000000000000010) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Select output 2
    in = 1;
    sel = 2;
    #10;
    if (out !== 16'b0000000000000100) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Select output 3
    in = 1;
    sel = 3;
    #10;
    if (out !== 16'b0000000000001000) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Select output 15
    in = 1;
    sel = 15;
    #10;
    if (out !== 16'b1000000000000000) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Check all outputs are low when in is low
    in = 0;
    sel = 0;
    #10;
    if (out !== 16'b0000000000000000) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // Test case 7: Check all outputs are low when in is low and sel changes
    in = 0;
    sel = 1;
    #10;
    if (out !== 16'b0000000000000000) begin
        $display("FAIL: Test case 7 failed");
        $finish;
    end

    // Test case 8: Check all outputs are low when in is low and sel is at max
    in = 0;
    sel = 15;
    #10;
    if (out !== 16'b0000000000000000) begin
        $display("FAIL: Test case 8 failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule