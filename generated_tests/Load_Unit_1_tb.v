`timescale 1ns/1ps

module tb_Load_Unit;

    reg [31:0] data_in;
    reg lb;
    reg lh;
    reg load_signext;
    wire [31:0] data_out;

    // Instantiate the Load_Unit module
    Load_Unit uut (
        .data_in(data_in),
        .lb(lb),
        .lh(lh),
        .load_signext(load_signext),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: Load word (lw)
        data_in = 32'hAABBCCDD; lb = 0; lh = 0; load_signext = 0;
        #10;
        if (data_out !== 32'hAABBCCDD) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Load byte unsigned (lbu)
        data_in = 32'hAABBCCDD; lb = 1; lh = 0; load_signext = 0;
        #10;
        if (data_out !== 32'h000000DD) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Load byte signed (lb)
        data_in = 32'hAABBCCDD; lb = 1; lh = 0; load_signext = 1;
        #10;
        if (data_out !== 32'hFFFFFFDD) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Load halfword unsigned (lhu)
        data_in = 32'hAABBCCDD; lb = 0; lh = 1; load_signext = 0;
        #10;
        if (data_out !== 32'h0000CCDD) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Load halfword signed (lh)
        data_in = 32'hAABBCCDD; lb = 0; lh = 1; load_signext = 1;
        #10;
        if (data_out !== 32'hFFFFCCDD) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Load word with different input
        data_in = 32'h12345678; lb = 0; lh = 0; load_signext = 0;
        #10;
        if (data_out !== 32'h12345678) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule