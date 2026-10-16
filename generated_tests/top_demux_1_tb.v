`timescale 1ns/1ps

module tb_top_demux;

    parameter DW = 8;
    parameter N = 8;
    parameter SEL = $clog2(N);
    
    reg [DW-1:0] in_a;
    reg [SEL-1:0] select;
    wire [(DW*N)-1:0] out_a;

    // Instantiate the module under test
    top_demux #(DW, N) uut (
        .in_a(in_a),
        .select(select),
        .out_a(out_a)
    );

    initial begin
        // Test case 1: Select output 0
        in_a = 8'hAA; // Input value
        select = 3'b000; // Select output 0
        #10;
        if (out_a !== 8'hAA) begin
            $display("FAIL: Test case 1 failed, expected out_a = 8'hAA, got out_a = %h", out_a);
            $finish;
        end

        // Test case 2: Select output 1
        in_a = 8'hBB; // Input value
        select = 3'b001; // Select output 1
        #10;
        if (out_a[15:8] !== 8'hBB) begin
            $display("FAIL: Test case 2 failed, expected out_a[15:8] = 8'hBB, got out_a = %h", out_a);
            $finish;
        end

        // Test case 3: Select output 2
        in_a = 8'hCC; // Input value
        select = 3'b010; // Select output 2
        #10;
        if (out_a[23:16] !== 8'hCC) begin
            $display("FAIL: Test case 3 failed, expected out_a[23:16] = 8'hCC, got out_a = %h", out_a);
            $finish;
        end

        // Test case 4: Select output 3
        in_a = 8'hDD; // Input value
        select = 3'b011; // Select output 3
        #10;
        if (out_a[31:24] !== 8'hDD) begin
            $display("FAIL: Test case 4 failed, expected out_a[31:24] = 8'hDD, got out_a = %h", out_a);
            $finish;
        end

        // Test case 5: Select output 4
        in_a = 8'hEE; // Input value
        select = 3'b100; // Select output 4
        #10;
        if (out_a[39:32] !== 8'hEE) begin
            $display("FAIL: Test case 5 failed, expected out_a[39:32] = 8'hEE, got out_a = %h", out_a);
            $finish;
        end

        // Test case 6: Select output 5
        in_a = 8'hFF; // Input value
        select = 3'b101; // Select output 5
        #10;
        if (out_a[47:40] !== 8'hFF) begin
            $display("FAIL: Test case 6 failed, expected out_a[47:40] = 8'hFF, got out_a = %h", out_a);
            $finish;
        end

        // Test case 7: Select output 6
        in_a = 8'h11; // Input value
        select = 3'b110; // Select output 6
        #10;
        if (out_a[55:48] !== 8'h11) begin
            $display("FAIL: Test case 7 failed, expected out_a[55:48] = 8'h11, got out_a = %h", out_a);
            $finish;
        end

        // Test case 8: Select output 7
        in_a = 8'h22; // Input value
        select = 3'b111; // Select output 7
        #10;
        if (out_a[63:56] !== 8'h22) begin
            $display("FAIL: Test case 8 failed, expected out_a[63:56] = 8'h22, got out_a = %h", out_a);
            $finish;
        end

        // Check that all other outputs are zero
        if (out_a[7:0] !== 8'h00 || out_a[15:8] !== 8'h00 || out_a[23:16] !== 8'h00 || 
            out_a[31:24] !== 8'h00 || out_a[39:32] !== 8'h00 || out_a[47:40] !== 8'h00 || 
            out_a[55:48] !== 8'h00 || out_a[63:56] !== 8'h22) begin
            $display("FAIL: Not all other outputs are zero when one output is selected.");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule