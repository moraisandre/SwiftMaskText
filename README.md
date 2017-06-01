# SwiftMaskText
Another Swift plugin that allow add mask to UITextField

<img src="https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/appPreview.png" />

<h3>Why to use it?</h3>
<ul>
  <li>'Cos it's simples and fast</li>
  <li>Configuration is through Settings Panel</li>
  <li>Works with <b>Swift 3.0</b> (Thanks to @andre991) </li>
</ul>
<h2>Mask Configuration</h2>
<h3>Mask Symbols</h3>
<table>
  <tr>
    <th>Character</th>
    <th>Format</th>
  </tr>
  <tr>
    <td>N</td>
    <td>Number only [0-9]</td>
  </tr>
  <tr>
    <td>C</td>
    <td>Characters [A-Z] (Always upper case)</td>
  </tr>
  <tr>
    <td>c</td>
    <td>Characters [a-z] (Always lower case)</td>
  </tr>
  <tr>
    <td>X</td>
    <td>Characters [a-Z]</td>
  </tr>
  <tr>
    <td>U</td>
    <td>Characters + Numbers [A-Z] + [0-9] (Always upper case)</td>
  </tr>
  <tr>
    <td>u</td>
    <td>Characters + Numbers [a-z] + [0-9] (Always lower case)</td>
  </tr>
  <tr>
    <td>%</td>
    <td>Characters + Numbers [a-Z] + [0-9]</td>
  </tr>
  <tr>
    <td>*</td>
    <td>Any character (Including special ones)</td>
  </tr>
</table>
<h3>Some examples</h3>
<table>
  <caption>Internacional examples</caption>
  <tr>
    <th>Field</th>
    <th>Mask</th>
  </tr>
  <tr>
    <td>SSN</td>
    <td>NNN-NN-NNNN</td>
  </tr>
  <tr>
    <td>Telephone</td>
    <td>+NN (NNN) NNN-NNNN</td>
  </tr>
  <tr>
    <td>Credit Card</td>
    <td>NNNN-NNNN-NNNN-NNNN</td>
  </tr>
</table>
<table>
  <caption>Brazilian examples</caption>
  <tr>
    <th>Field</th>
    <th>Mask</th>
  </tr>
  <tr>
    <td>Telephone</td>
    <td>+NN (0NN) NNNNN-NNNN</td>
  </tr>
  <tr>
    <td>CPF</td>
    <td>NNN.NNN.NNN-NN</td>
  </tr>
  <tr>
    <td>RG</td>
    <td>NN.NNN.NNN-%</td>
  </tr>
  <tr>
    <td>CEP</td>
    <td>NNNNN-NNN</td>
  </tr>
</table>
<h2>How to use it?</h2>
<ol>
  <li>
    Add the <i>SwiftMaskField</i> folder to your project, it contains 2 files. Be sure that <i>'Copy items if needed'</i> is checked.
    <img src="https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/CopyItemsIfNeeded.png" />
  </li>
  <li>
    In your <i>ViewController</i> add an <i>UITextField</i> object. In 'Settings Panel' -> 'Identity inspector' set Class to <i>'SwiftMaskField'</i>
    <img src="https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/customClass.png" />
  </li>
  <li>
    Now go into 'Settings Panel' -> 'Attributes inspector' and set the Mask that you want it to
    <img src="https://github.com/moraisandre/SwiftMaskText/blob/master/Assets/swiftMaskField.png" />
  </li>
  <li>
    Done!
  </li>
</ol>
<h2>More info</h2>
<h3>Author</h3>
<i>André Morais</i> </br>
Website: www.andremorais.com.br </br>
E-mail: <a href="mailto:morais@andremorais.com.br?Subject=GitHub%20doubt" target="_top">morais@andremorais.com.br</a>
<h3>License</h3>
Under the <a href="http://www.opensource.org/licenses/MIT">MIT license</a>
