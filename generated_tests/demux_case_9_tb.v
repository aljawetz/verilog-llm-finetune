`timescale 1ns/1ps

module tb_demux_case;

    // Inputs
    reg [2:0] sel;
    reg i;

    // Outputs
    wire o0, o1, o2, o3, o4, o5, o6, o7;

    // Instantiate the Unit Under Test (UUT)
    demux_case uut (
        .o0(o0), 
        .o1(o1), 
        .o2(o2), 
        .o3(o3), 
        .o4(o4), 
        .o5(o5), 
        .o6(o6), 
        .o7(o7), 
        .sel(sel), 
        .i(i)
    );

    initial begin
        // Initialize inputs
        i = 0;
        sel = 3'b000;

        // Test all select lines
        for (integer j = 0; j < 8; j = j + 1) begin
            sel = j; // Set select line
            i = 1;   // Set input high
            #10;     // Wait for a while
            
            // Check outputs
            if (j == 0 && o0 !== 1) begin
                $display("FAIL: Output o0 should be 1 when sel is 000");
                $finish;
            end
            else if (j == 1 && o1 !== 1) begin
                $display("FAIL: Output o1 should be 1 when sel is 001");
                $finish;
            end
            else if (j == 2 && o2 !== 1) begin
                $display("FAIL: Output o2 should be 1 when sel is 010");
                $finish;
            end
            else if (j == 3 && o3 !== 1) begin
                $display("FAIL: Output o3 should be 1 when sel is 011");
                $finish;
            end
            else if (j == 4 && o4 !== 1) begin
                $display("FAIL: Output o4 should be 1 when sel is 100");
                $finish;
            end
            else if (j == 5 && o5 !== 1) begin
                $display("FAIL: Output o5 should be 1 when sel is 101");
                $finish;
            end
            else if (j == 6 && o6 !== 1) begin
                $display("FAIL: Output o6 should be 1 when sel is 110");
                $finish;
            end
            else if (j == 7 && o7 !== 1) begin
                $display("FAIL: Output o7 should be 1 when sel is 111");
                $finish;
            end
            
            // Check that all other outputs are low
            for (integer k = 0; k < 8; k = k + 1) begin
                if (k != j) begin
                    if (uut.y_int[k] !== 0) begin
                        $display("FAIL: Output o%d should be 0 when sel is %03b", k, j);
                        $finish;
                    end
                end
            end
            
            // Set input low for next test
            i = 0;
            #10; // Wait for a while
        end

        $display("PASS");
        $finish;
    end

endmodule