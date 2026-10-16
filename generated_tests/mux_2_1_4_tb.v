`timescale 1ns/1ps

module tb_mux_2_1;

    reg [1:0] i;
    reg sel;
    wire y_out;

    // Instantiate the module under test (uut)
    mux_2_1 uut (
        .i(i),
        .sel(sel),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: sel = 0, expect y_out = i[0]
        i = 2'b01; sel = 0; #10;
        if (y_out !== i[0]) begin
            $display("FAIL: Test case 1 failed, expected %b but got %b", i[0], y_out);
            $finish;
        end

        // Test case 2: sel = 1, expect y_out = i[1]
        i = 2'b10; sel = 1; #10;
        if (y_out !== i[1]) begin
            $display("FAIL: Test case 2 failed, expected %b but got %b", i[1], y_out);
            $finish;
        end

        // Test case 3: sel = 0, expect y_out = i[0]
        i = 2'b11; sel = 0; #10;
        if (y_out !== i[0]) begin
            $display("FAIL: Test case 3 failed, expected %b but got %b", i[0], y_out);
            $finish;
        end

        // Test case 4: sel = 1, expect y_out = i[1]
        i = 2'b00; sel = 1; #10;
        if (y_out !== i[1]) begin
            $display("FAIL: Test case 4 failed, expected %b but got %b", i[1], y_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule