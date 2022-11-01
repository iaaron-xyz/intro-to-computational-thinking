### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ d6ee91ea-e750-11ea-1260-31ebf3ec6a9b
using Compose

# ╔═╡ 5acd58e0-e856-11ea-2d3d-8329889fe16f
using PlutoUI

# ╔═╡ fafae38e-e852-11ea-1208-732b4744e4c2
md"_Homework 0, version 4 -- Spring 2021_"

# ╔═╡ 836c33ad-c4e1-4c14-b759-f8c7cd906b88
TableOfContents()

# ╔═╡ a2181260-e6cd-11ea-2a69-8d9d31d1ef0e
md"""
# Homework 0: Getting up and running

HW0 release date: Monday, Feb 15, 2021.

**HW0 due date: Thursday, Feb 18, 2021, 11:59pm EST**, _but best completed before Wednesday's lecture if possible_.

First of all, **_welcome to the course!_** We are excited to teach you about real world applications of scientific computing, using the same tools that we work with ourselves.

We'd like everyone to **submit this zeroth homework assignment**. It will not affect your grade, but it will help us get everything running smoothly when the course starts. If you're stuck or don't have much time, just fill in your name and ID and submit 🙂
"""

# ╔═╡ 31a8fbf8-e6ce-11ea-2c66-4b4d02b41995
md"""## Homework Logistics
Homeworks are in the form of [Pluto notebooks](https://github.com/fonsp/Pluto.jl). Your must complete them and submit them on [Canvas](https://canvas.mit.edu/courses/5637) (if you are an MIT student.). If you are not an MIT student, we encourage you to [join Discord](https://discord.gg/Z5qnVf8) and find someone to cross-grade.

Homeworks will be released on Thursdays and due on Thursdays 11:59pm Eastern time.

HW0 is for you to get your system set up correctly and to test our grading software. You must submit it but it will not count towards your grade.
"""

# ╔═╡ f9d7250a-706f-11eb-104d-3f07c59f7174
md"## Requirements of this HW0

- Install Julia and set up Pluto    
- Do the required Exercise 0.

That’s it, but if you like you can do the _OPTIONAL_ exercises that follow."

# ╔═╡ 430a260e-6cbb-11eb-34af-31366543c9dc
md"""# Installation
Before being able to run this notebook succesfully locally, you will need to [set up Julia and Pluto.](/Spring21/installation/)

One you have Julia and Pluto installed, you can click the button at the top right of this page and follow the instructions to edit this notebook locally and submit.
"""

# ╔═╡ a05d2bc8-7024-11eb-08cb-196543bbb8fd
md"## (Required) Exercise 0 - _Making a basic function_

Computing the square of a number is easy -- you just multiply it with itself.

##### Algorithm:

Given: $x$

Output: $x^2$

1. Multiply `x` by `x`"

# ╔═╡ e02f7ea6-7024-11eb-3672-fd59a6cff79b
function basic_square(x)
	return x*x
end

# ╔═╡ 6acef56c-7025-11eb-2524-819c30a75d39
let
	result = basic_square(5)
	if !(result isa Number)
		md"""
!!! warning "Not a number"
    `basic_square` did not return a number. Did you forget to write `return`?
		"""
	elseif abs(result - 5*5) < 0.01
		md"""
!!! correct
    Well done!
		"""
	else
		md"""
!!! warning "Incorrect"
    Keep working on it!
		"""
	end
end

# ╔═╡ 348cea34-7025-11eb-3def-41bbc16c7512
md"That's all that's required for this week. Please submit the notebook. We just wanted to make sure that you're up and running.

If you want to explore further, we have included a few optional exercises below."

# ╔═╡ 339c2d5c-e6ce-11ea-32f9-714b3628909c
md"## (Optional) Exercise 1 - _Square root by Newton's method_

Computing the square of a number is easy -- you already did it.

But how does one compute the square root of a number?

##### Algorithm:

Given: $x$

Output: $\sqrt{x}$

1. Take a guess `a`
1. Divide `x` by `a`
1. Set a = the average of `x/a` and `a`. (The square root must be between these two numbers. Why?)
1. Repeat until `x/a` is roughly equal to `a`. Return `a` as the square root.

In general, you will never get to the point where `x/a` is _exactly_ equal to `a`. So if our algorithm keeps going until `x/a == a`, then it will get stuck.

So instead, the algorithm takes a parameter `error_margin`, which is used to decide when `x/a` and `a` are close enough to halt.
"

# ╔═╡ 56866718-e6ce-11ea-0804-d108af4e5653
md"### Exercise 1.1

Step 3 in the algorithm sets the new guess to be the average of `x/a` and the old guess `a`.

This is because the square root must be between the numbers `x/a` and `a`. Why?
"

# ╔═╡ 92670cc9-477f-48ab-963e-0389f48720de
md"""
### Exercise 1.1 (Solution)
"""

# ╔═╡ bccf0e88-e754-11ea-3ab8-0170c2d44628
ex_1_1 = md"""
First let's define our terms:
- *a* is root guess.
- *x* is the number we want to get the square root from.

Being $a$ our guess, if it turns out to be bigger that the real square root $x$, then $x/a$ will be smaller than the real square root of $x$, if we compute the average of those guesses we will get the average, that will be closer to the true value.
""" 

# you might need to wait until all other cells in this notebook have completed running. 
# scroll down the page to see what's up

# ╔═╡ e7abd366-e7a6-11ea-30d7-1b6194614d0a
if !(@isdefined ex_1_1)
	md"""Do not change the name of the variable - write you answer as `ex_1_1 = "..."`"""
end

# ╔═╡ d62f223c-e754-11ea-2470-e72a605a9d7e
md"### Exercise 1.2

Write a function newton_sqrt(x) which implements the above algorithm."

# ╔═╡ b7df6da3-0828-4647-b009-31a24e2a882d
md"""
### Exercise 1.2 (Solution)
"""

# ╔═╡ 4896bf0c-e754-11ea-19dc-1380bb356ab6
function newton_sqrt(x, error_margin=0.01, a=x / 2) # a=x/2 is the default value of `a`
	# compute a until difference smaller than error marign
	while abs(x - a*a) > error_margin
		a = 0.5*(a + x/a)
	end
	# return the last number assigned
	return a
end

# ╔═╡ 7a01a508-e78a-11ea-11da-999d38785348
newton_sqrt(2)

# ╔═╡ 682db9f8-e7b1-11ea-3949-6b683ca8b47b
let
	result = newton_sqrt(2, 0.01)
	if !(result isa Number)
		md"""
!!! warning "Not a number"
    `newton_sqrt` did not return a number. Did you forget to write `return`?
		"""
	elseif abs(result - sqrt(2)) < 0.01
		md"""
!!! correct
    Well done!
		"""
	else
		md"""
!!! warning "Incorrect"
    Keep working on it!
		"""
	end
end

# ╔═╡ 088cc652-e7a8-11ea-0ca7-f744f6f3afdd
md"""
!!! hint
    `abs(r - s)` is the distance between `r` and `s`
"""

# ╔═╡ c18dce7a-e7a7-11ea-0a1a-f944d46754e5
md"""
!!! hint
    If you're stuck, feel free to cheat, this is homework 0 after all 🙃

    Julia has a function called `sqrt`
"""

# ╔═╡ 5e24d95c-e6ce-11ea-24be-bb19e1e14657
md"## (Optional) Exercise 2 - _Sierpinksi's triangle_

Sierpinski's triangle is defined _recursively_:

- Sierpinski's triangle of complexity N is a figure in the form of a triangle which is made of 3 triangular figures which are themselves Sierpinski's triangles of complexity N-1.

- A Sierpinski's triangle of complexity 0 is a simple solid equilateral triangle
"

# ╔═╡ 6b8883f6-e7b3-11ea-155e-6f62117e123b
md"To draw Sierpinski's triangle, we are going to use an external package, [_Compose.jl_](https://giovineitalia.github.io/Compose.jl/latest/tutorial). Let's import it!

A package contains a coherent set of functionality that you can often use a black box according to its specification. There are [lots of Julia packages](https://juliahub.com/ui/Home).
"

# ╔═╡ dbc4da6a-e7b4-11ea-3b70-6f2abfcab992
md"Just like the definition above, our `sierpinksi` function is _recursive_: it calls itself."

# ╔═╡ 02b9c9d6-e752-11ea-0f32-91b7b6481684
complexity = 5

# ╔═╡ 1eb79812-e7b5-11ea-1c10-63b24803dd8a
if complexity == 3 
	md"""
Try changing the value of **`complexity` to `5`** in the cell above. 

Hit `Shift+Enter` to affect the change.
	"""
else
	md"""
**Great!** As you can see, all the cells in this notebook are linked together by the variables they define and use. Just like a spreadsheet!
	"""
end

# ╔═╡ d7e8202c-e7b5-11ea-30d3-adcd6867d5f5
md"### Exercise 2.1

As you can see, the total area covered by triangles is lower when the complexity is higher."

# ╔═╡ f22222b4-e7b5-11ea-0ea0-8fa368d2a014
md"""
Can you write a function that computes the _area of `sierpinski(n)`_, as a fraction of the area of `sierpinski(0)`?

So:
```
area_sierpinski(0) = 1.0
area_sierpinski(1) = 0.??
...
```
"""

# ╔═╡ b332e0fa-a231-4366-9067-1da389946e26
md"""
### Exercise 2.1 (Solution)
"""

# ╔═╡ ff4a13fd-3170-4b02-910f-727c19115bc7
md"""
The Area of the Sierpinski Triangle it reduces in $3/4$ each iteration. That is:
- When N = 0; Area = 1
- When N = 1; Area = 3/4
- When N = 2; Area = 9/16
- ...

In general:
Area = $(\frac{3}{4})^N$, where $N$ is the complexity.
"""

# ╔═╡ ca8d2f72-e7b6-11ea-1893-f1e6d0a20dc7
function area_sierpinski(n)
	return 0.75^n
end

# ╔═╡ 71c78614-e7bc-11ea-0959-c7a91a10d481
if area_sierpinski(0) == 1.0 && area_sierpinski(1) == 3 / 4
	md"""
!!! correct
    Well done!
	"""
else
	md"""
!!! warning "Incorrect"
    Keep working on it!
	"""
end

# ╔═╡ c21096c0-e856-11ea-3dc5-a5b0cbf29335
md"**Let's try it out below:**"

# ╔═╡ 52533e00-e856-11ea-08a7-25e556fb1127
md"Complexity = $(@bind n Slider(0:6, show_value=true))"

# ╔═╡ c1ecad86-e7bc-11ea-1201-23ee380181a1
md"""
!!! hint
    Can you write `area_sierpinksi(n)` as a function of `area_sierpinski(n-1)`?
"""

# ╔═╡ a60a492a-e7bc-11ea-0f0b-75d81ce46a01
md"That's it for now, see you next week!"

# ╔═╡ bee2a87c-7cfe-41ac-bba3-8bd82e8dd125
md"""
## Used functions
"""

# ╔═╡ dfdeab34-e751-11ea-0f90-2fa9bbdccb1e
triangle() = compose(context(), polygon([(1, 1), (0, 1), (1 / 2, 0)]))

# ╔═╡ b923d394-e750-11ea-1971-595e09ab35b5
# It does not matter which order you define the building blocks (functions) of the
# program in. The best way to organize code is the one that promotes understanding.

function place_in_3_corners(t)
	# Uses the Compose library to place 3 copies of t
	# in the 3 corners of a triangle.
	# treat this function as a black box,
	# or learn how it works from the Compose documentation here https://giovineitalia.github.io/Compose.jl/latest/tutorial/#Compose-is-declarative-1
	compose(context(),
			(context(1 / 4,   0, 1 / 2, 1 / 2), t),
			(context(0, 1 / 2, 1 / 2, 1 / 2), t),
			(context(1 / 2, 1 / 2, 1 / 2, 1 / 2), t))
end

# ╔═╡ e2848b9a-e703-11ea-24f9-b9131434a84b
function sierpinski(n)
	if n == 0
		triangle()
	else
		t = sierpinski(n - 1) # recursively construct a smaller sierpinski's triangle
		place_in_3_corners(t) # place it in the 3 corners of a triangle
	end
end

# ╔═╡ 9664ac52-e750-11ea-171c-e7d57741a68c
sierpinski(complexity)

# ╔═╡ df0a4068-e7b2-11ea-2475-81b237d492b3
sierpinski.(0:6)

# ╔═╡ 147ed7b0-e856-11ea-0d0e-7ff0d527e352
md"""

Sierpinski's triangle of complexity $(n)

 $(sierpinski(n))

has area **$(area_sierpinski(n))**

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Compose = "a81c6b42-2e10-5240-aca2-a61377ecd94b"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Compose = "~0.9.3"
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "63d1e802de0c4882c00aee5cb16f9dd4d6d7c59c"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.1"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "b153278a25dd42c65abbf4e62344f9d22e59191b"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.43.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Compose]]
deps = ["Base64", "Colors", "DataStructures", "Dates", "IterTools", "JSON", "LinearAlgebra", "Measures", "Printf", "Random", "Requires", "Statistics", "UUIDs"]
git-tree-sha1 = "9a2695195199f4f20b94898c8a8ac72609e165a4"
uuid = "a81c6b42-2e10-5240-aca2-a61377ecd94b"
version = "0.9.3"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "cc1a8e22627f33c789ab60b36a9132ac050bbf75"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.12"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─fafae38e-e852-11ea-1208-732b4744e4c2
# ╠═836c33ad-c4e1-4c14-b759-f8c7cd906b88
# ╟─a2181260-e6cd-11ea-2a69-8d9d31d1ef0e
# ╟─31a8fbf8-e6ce-11ea-2c66-4b4d02b41995
# ╟─f9d7250a-706f-11eb-104d-3f07c59f7174
# ╟─430a260e-6cbb-11eb-34af-31366543c9dc
# ╟─a05d2bc8-7024-11eb-08cb-196543bbb8fd
# ╠═e02f7ea6-7024-11eb-3672-fd59a6cff79b
# ╟─6acef56c-7025-11eb-2524-819c30a75d39
# ╟─348cea34-7025-11eb-3def-41bbc16c7512
# ╟─339c2d5c-e6ce-11ea-32f9-714b3628909c
# ╟─56866718-e6ce-11ea-0804-d108af4e5653
# ╟─92670cc9-477f-48ab-963e-0389f48720de
# ╟─bccf0e88-e754-11ea-3ab8-0170c2d44628
# ╟─e7abd366-e7a6-11ea-30d7-1b6194614d0a
# ╟─d62f223c-e754-11ea-2470-e72a605a9d7e
# ╠═b7df6da3-0828-4647-b009-31a24e2a882d
# ╠═4896bf0c-e754-11ea-19dc-1380bb356ab6
# ╠═7a01a508-e78a-11ea-11da-999d38785348
# ╟─682db9f8-e7b1-11ea-3949-6b683ca8b47b
# ╟─088cc652-e7a8-11ea-0ca7-f744f6f3afdd
# ╟─c18dce7a-e7a7-11ea-0a1a-f944d46754e5
# ╟─5e24d95c-e6ce-11ea-24be-bb19e1e14657
# ╟─6b8883f6-e7b3-11ea-155e-6f62117e123b
# ╠═d6ee91ea-e750-11ea-1260-31ebf3ec6a9b
# ╠═5acd58e0-e856-11ea-2d3d-8329889fe16f
# ╟─dbc4da6a-e7b4-11ea-3b70-6f2abfcab992
# ╠═e2848b9a-e703-11ea-24f9-b9131434a84b
# ╠═9664ac52-e750-11ea-171c-e7d57741a68c
# ╠═02b9c9d6-e752-11ea-0f32-91b7b6481684
# ╟─1eb79812-e7b5-11ea-1c10-63b24803dd8a
# ╟─d7e8202c-e7b5-11ea-30d3-adcd6867d5f5
# ╠═df0a4068-e7b2-11ea-2475-81b237d492b3
# ╟─f22222b4-e7b5-11ea-0ea0-8fa368d2a014
# ╟─b332e0fa-a231-4366-9067-1da389946e26
# ╟─ff4a13fd-3170-4b02-910f-727c19115bc7
# ╠═ca8d2f72-e7b6-11ea-1893-f1e6d0a20dc7
# ╟─71c78614-e7bc-11ea-0959-c7a91a10d481
# ╟─c21096c0-e856-11ea-3dc5-a5b0cbf29335
# ╟─52533e00-e856-11ea-08a7-25e556fb1127
# ╟─147ed7b0-e856-11ea-0d0e-7ff0d527e352
# ╟─c1ecad86-e7bc-11ea-1201-23ee380181a1
# ╟─a60a492a-e7bc-11ea-0f0b-75d81ce46a01
# ╟─bee2a87c-7cfe-41ac-bba3-8bd82e8dd125
# ╟─dfdeab34-e751-11ea-0f90-2fa9bbdccb1e
# ╟─b923d394-e750-11ea-1971-595e09ab35b5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
