`timescale 1ns/1ps

module tb_mux_2x1;

    // Inputs
    reg [1:0] i;
    reg select;

    // Output
    wire y_out;

    // Instantiate the Unit Under Test (UUT)
    mux_2x1 uut (
        .i(i),
        .select(select),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: select = 0, expect y_out = i[0]
        i = 2'b00; select = 0; #10;
        if (y_out !== 1'b0) begin
            $display("FAIL: Test case 1 failed, expected y_out = 0, got %b", y_out);
            $finish;
        end

        // Test case 2: select = 0, expect y_out = i[0]
        i = 2'b01; select = 0; #10;
        if (y_out !== 1'b1) begin
            $display("FAIL: Test case 2 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 3: select = 1, expect y_out = i[1]
        i = 2'b10; select = 1; #10;
        if (y_out !== 1'b1) begin
            $display("FAIL: Test case 3 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 4: select = 1, expect y_out = i[1]
        i = 2'b11; select = 1; #10;
        if (y_out !== 1'b1) begin
            $display("FAIL: Test case 4 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        // Test case 5: select = 0, expect y_out = i[0]
        i = 2'b10; select = 0; #10;
        if (y_out !== 1'b0) begin
            $display("FAIL: Test case 5 failed, expected y_out = 0, got %b", y_out);
            $finish;
        end

        // Test case 6: select = 0, expect y_out = i[0]
        i = 2'b11; select = 0; #10;
        if (y_out !== 1'b1) begin
            $display("FAIL: Test case 6 failed, expected y_out = 1, got %b", y_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule