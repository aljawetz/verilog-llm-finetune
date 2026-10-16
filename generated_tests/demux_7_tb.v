`timescale 1ns/1ps

module tb_demux;

    reg i;
    reg sel_n;
    wire [1:0] y_out;

    // Instantiate the demux module
    demux uut (
        .i(i),
        .sel_n(sel_n),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: sel_n = 0, i = 1
        i = 1; sel_n = 0;
        #10;
        if (y_out !== 2'b01) begin
            $display("FAIL: Test case 1 failed, expected y_out = 2'b01, got y_out = %b", y_out);
            $finish;
        end

        // Test case 2: sel_n = 0, i = 0
        i = 0; sel_n = 0;
        #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Test case 2 failed, expected y_out = 2'b00, got y_out = %b", y_out);
            $finish;
        end

        // Test case 3: sel_n = 1, i = 1
        i = 1; sel_n = 1;
        #10;
        if (y_out !== 2'b10) begin
            $display("FAIL: Test case 3 failed, expected y_out = 2'b10, got y_out = %b", y_out);
            $finish;
        end

        // Test case 4: sel_n = 1, i = 0
        i = 0; sel_n = 1;
        #10;
        if (y_out !== 2'b00) begin
            $display("FAIL: Test case 4 failed, expected y_out = 2'b00, got y_out = %b", y_out);
            $finish;
        end

        // Test case 5: sel_n = 0, i = 1, check non-selected output
        i = 1; sel_n = 0;
        #10;
        if (y_out[1] !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected y_out[1] = 0, got y_out[1] = %b", y_out[1]);
            $finish;
        end

        // Test case 6: sel_n = 1, i = 1, check non-selected output
        i = 1; sel_n = 1;
        #10;
        if (y_out[0] !== 1'b0) begin
            $display("FAIL: Test case 6 failed, expected y_out[0] = 0, got y_out[0] = %b", y_out[0]);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule