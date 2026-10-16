`timescale 1ns/1ps

module tb_mux_8_2_1;

    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    // Instantiate the module under test (uut)
    mux_8_2_1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1: Select input 0
        in = 8'b10101010; // Input pattern
        sel = 3'b000;    // Select first bit
        #10;             // Wait for a short time
        if (out !== in[0]) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", in[0], out);
            $finish;
        end

        // Test case 2: Select input 1
        sel = 3'b001;    // Select second bit
        #10;             
        if (out !== in[1]) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", in[1], out);
            $finish;
        end

        // Test case 3: Select input 2
        sel = 3'b010;    // Select third bit
        #10;             
        if (out !== in[2]) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", in[2], out);
            $finish;
        end

        // Test case 4: Select input 3
        sel = 3'b011;    // Select fourth bit
        #10;             
        if (out !== in[3]) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", in[3], out);
            $finish;
        end

        // Test case 5: Select input 4
        sel = 3'b100;    // Select fifth bit
        #10;             
        if (out !== in[4]) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", in[4], out);
            $finish;
        end

        // Test case 6: Select input 5
        sel = 3'b101;    // Select sixth bit
        #10;             
        if (out !== in[5]) begin
            $display("FAIL: Test case 6 failed, expected %b, got %b", in[5], out);
            $finish;
        end

        // Test case 7: Select input 6
        sel = 3'b110;    // Select seventh bit
        #10;             
        if (out !== in[6]) begin
            $display("FAIL: Test case 7 failed, expected %b, got %b", in[6], out);
            $finish;
        end

        // Test case 8: Select input 7
        sel = 3'b111;    // Select eighth bit
        #10;             
        if (out !== in[7]) begin
            $display("FAIL: Test case 8 failed, expected %b, got %b", in[7], out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule