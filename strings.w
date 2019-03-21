(defn str_len [s]
  (loop [p_char s
         len 0]
         (if (== (mem p_char) 0)
           len
           (recur [p_char (+ p_char 1)
                   len (+ len 1)]))))

(deftest str_len_examples
  (is (== 3 (str_len "abc")) "abc should be 3 characters")
  (is (== 0 (str_len "")) "empty string should be 0 characters"))

(defn str_eq [a b]
  (if (== (str_len a) (str_len b))
    (loop [i 0]
           (if (and (or (mem (+ a i)) 0) (== (mem (+ b i)) 0))
               true
               (if (!= (mem (+ a i)) (mem (+ b i)))
                    false
                    (recur [i (+ i 1)]))))
    false))

(deftest str_eq_examples
  (is (== false (str_eq "a" "")) "false if lengths not equal")
  (is (== true (str_eq "" ""))  "true if both empty")
  (is (== false (str_eq "a" "b"))  "false if single character not equal")
  (is (== false (str_eq "aa" "ab"))  "false if multi character not equal"))

(defn str_concat [a b]
  (let [a_len (str_len a)
        b_len (str_len b)
        new_string (malloc (+ (+ a_len b_len) 1))]
    (memcopy a new_string a_len)
    (memcopy b (+ new_string a_len) b_len)
    new_string))

(deftest str_concat_examples
  (is (== 6 (str_len (str_concat "abc" "xyz"))) "abcxyz should be 6 characters")
  (is (str_eq "abcxyz" (str_concat "abc" "xyz")) "concat of abc and xyz should match abcxyz")
  (is (str_eq "abc" (str_concat "abc" "")) "concat of abc and empty should match abc"))

(defn str_join [str_list separator]
  (if (is_none str_list)
    ""
    (loop [str (head str_list)
           item (tail str_list)]
           (if (is_none item)
               str
               (recur [str (str_concat (str_concat str separator) (head item))
                       item (tail item)])))))

(deftest str_join_examples
  (is (str_eq "" (str_join None ",")) "join empty should be empty string")
  (is (str_eq "a" (str_join (cons "a" None) ",")) "join single item should be a")
  (is (str_eq "a,b" (str_join (cons "a" (cons "b" None)) ",")) "join two items should be a,b")
  (is (str_eq "a,b,c" (str_join (cons "a" (cons "b" (cons "c" None))) ",")) "join two items should be a,b"))
